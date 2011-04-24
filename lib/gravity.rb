require 'digest/md5'
require "net/http"
require "net/https"
require "uri"
require "json"

module Gravity
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    attr_accessor :gravatar_options

    def has_gravatar options = {}
      send :include, InstanceMethods

      self.gravatar_options = {
        :email => :email,
        :secure => false
      }.merge(options)
    end
  end

  module InstanceMethods
    def gravatar_hash(email)
      Digest::MD5.hexdigest email.to_s.strip.downcase
    end

    def gravatar_url(secure)
      'http' + (secure ? 's://secure.' : '://') + 'gravatar.com/'
    end

    def gravatar_image(options = {})
      options = self.class.gravatar_options.merge options
      email = self.send options.delete(:email)
      secure = options.delete :secure
      url = gravatar_url(secure) + 'avatar/' + gravatar_hash(email)

      if options.has_key?(:default)
        options[:default] = CGI::encode options[:default] if options[:default].match(/^http/)
      end

      if !options.empty?
        url += '?' + options.map{|o, v| "#{o}=#{v.to_s}"}.join('&')
      end

      url
    end

    def gravatar_profile(options = {})
      options = self.class.gravatar_options.merge options

      email = self.send options.delete(:email)
      secure = options.delete :secure
      url = gravatar_url(secure) + gravatar_hash(email) + '.json'

      json_profile = JSON.parse get(url)
      json_profile['entry'].first
    end

    def get(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)

      if response.kind_of?(Net::HTTPRedirection)
        get response['location']
      else
        response.body
      end
    end
  end
end

ActiveRecord::Base.send :include, Gravity
