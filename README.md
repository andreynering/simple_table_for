Simple Table For helper
=======================

Generate HTML tables in a simple and clean way.

## Installation

```ruby
gem 'simple_table_for', '~> 0.2.0'
```

## Usage

```erb
<%= table_for @users, [:name, :email, 'Registration date', 'Comments count', '-'], model: User do |user| %>
  <%= field user.name %>
  <%= field user.email %>
  <%= field user.created_at %>
  <%= field user.comments.count %>
  <%= field link_to('View', user) %>
<% end %>
```

The above will generate a table like:

| First name | Email         | Registration date | Comments count  | -         |
| ---------- | ------------- | ----------------- | --------------- | --------- |
| John       | john@john.com | 01/01/2015        | 15              | [View](#) |
| Mark       | mark@mark.com | 02/02/2015        | 34              | [View](#) |

The second parameter is a array of headers. For a Symbol header, the helper
will get the localizated name in `config/locales` folder. The `model` option
should be informed in this case. For a String header, the helper will just
print it as is.

You can optionally add an id or classes to tables and fields:

```erb
<%= table_for @users, [:name, '-'], model: User, id: 'users-table', class: 'table' do |user| %>
  <%= field user.name, class: 'user-name' %>
  <%= field link_to('View', user), class: 'user-link' %>
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
