Gravity
=======

Gravity is a simple [Gravatar](http://gravatar.com) plugin for Rails. It allows you to easily get Gravatar images and profile informations.

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

You can also pass options to the ´gravatar_image´ and ´gravatar_profile´ methods:

    <%= image_tag @user.gravatar_image :size => 40, :default => 'identicon' %>
    <%= @user.gravatar_profile(:secure => true)['displayName'] %>

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
    <td><b>default</b> or <b>d</b></td>
    <td>The avatar image used by default</td>
    <td><i>none</i></td>
    <td>"404", "mm", "identicon", "monsterid", "wavatar", "retro" or an absolute URL (encoded).</td>
  </tr>
  <tr>
    <td><b>rating</b> or <b>r</b></td>
    <td>The lowest level of ratings you want to allow</td>
    <td>G</td>
    <td>G, PG, R or X</td>
  </tr>
</table>

See the [Gravatar site](http://gravatar.com/site/implement/images) for more informations.

Copyright (c) 2011 Giuseppe Capizzi, released under the MIT license
