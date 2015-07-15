[![Gem Version](https://badge.fury.io/rb/simple_table_for.svg)](http://badge.fury.io/rb/simple_table_for)
[![Build Status](https://travis-ci.org/andreynering/simple_table_for.svg)](https://travis-ci.org/andreynering/simple_table_for)
[![Code Climate](https://codeclimate.com/github/andreynering/simple_table_for/badges/gpa.svg)](https://codeclimate.com/github/andreynering/simple_table_for)
[![Test Coverage](https://codeclimate.com/github/andreynering/simple_table_for/badges/coverage.svg)](https://codeclimate.com/github/andreynering/simple_table_for/coverage)

Simple Table For helper
=======================

Generate HTML tables in a simple and clean way.

## Installation

```ruby
gem 'simple_table_for'
```

## Usage

```erb
<%= table_for @users, [:name, :email, 'Registration date', 'Comments count', '-', '-'] do |user| %>
  <%= field user.name %>
  <%= field user.email %>
  <%= field l(user.created_at, format: '%d/%m/%Y') %>
  <%= field user.comments.count %>
  <%= field link_to('View', user) %>
  <%= field link_to('View', edit_users_path(user)) %>
<% end %>
```

The above will generate a table like:

| First name | E-mail        | Registration date | Comments count  | -         | -         |
| ---------- | ------------- | ----------------- | --------------- | --------- | --------- |
| John       | john@john.com | 01/01/2015        | 15              | [View](#) | [Edit](#) |
| Mark       | mark@mark.com | 02/02/2015        | 34              | [View](#) | [Edit](#) |

The second parameter is a array of headers. For a Symbol header, the helper
will get the localizated name in `config/locales` folder.
Example: for a `@users` collection and `:name` header it will search for
'<locale>/activerecord/attributes/user/name'.
For a String header, the helper will just print it as is.

You can optionally give adicional options, like id or classes to tables and fields:

```erb
<%= table_for @users, [:name, '-'], id: 'users-table', class: 'table' do |user| %>
  <%= field user.name, class: 'user-name' %>
  <%= field link_to('View', user), class: 'user-link' %>
<% end %>
```

`table_for` is aliased as `simple_table_for`, and `field` is aliased as `column`:

```erb
<%= simple_table_for @products, [:product_name, :price, 'Number of orders'] do |product| %>
  <%= column product.product_name %>
  <%= column product.price %>
  <%= column product.orders.count %>
<% end %>
```

## Setting default options

You can also set a default class for tables:

```ruby
# application.rb
class Application < Rails:Application
  # for a Bootstrap table
  config.simple_table_for.defaults = {
    class: 'table table-condensed table-striped table-bordered'
  }
end
```

This project uses MIT-LICENSE.

## Contributing

1. Fork it ( https://github.com/andreynering/simple_table_for/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
