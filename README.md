Gravity
=======

Gravity is a simple plugin for Rails. It allows you to easily get gravatar images and gravatar profile informations.

Installation
============

Just add it to your Gemfile like this:

gem "gravity"

and you're ready to go.

Usage
====

In your model:

    class User < ActiveRecord::Base
      has_gravatar
    end

In your views:

    <%= image_tag @user.gravatar_image %>
    <%= @user.gravatar_profile['displayName'] %>

This works if you have an `email` field in your model. To use a different field for email, pass the field name to the `:email` option:

    class User < ActiveRecord::Base
      has_gravatar :email => :email_address
    end

Here is a complete list of options:

<table width="100%">
  <thead>
    <th>Option</th>
    <th>Description</th>
    <th>Default</th>
    <th>Values<th>
  </tr>
  <tr>
    <td><b>secure</b></td>
    <td>Use SSL to call gravatar.org</td>
    <td>false</td>
    <td>true/false</td>
  </tr>
  <tr>
    <td><b>size</b> or <b>s</b></td>
    <td>The size of the image</td>
    <td>80</td>
    <td>1..512</td>
  </tr>
  <tr>
    <td><b>default</b></td>
    <td>The avatar image used by default</td>
    <td><i>none</i></td>
    <td>"identicon", "monsterid", "wavatar" or an absolute URL.</td>
  </tr>
  <tr>
    <td><b>rating</b></td>
    <td>The lowest level of ratings you want to allow</td>
    <td>G</td>
    <td>G, PG, R or X</td>
  </tr>
</table>

Example
=======



Copyright (c) 2011 [name of plugin creator], released under the MIT license
