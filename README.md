SimpleTableFor
==============

A simple helper to generate HTML tables in Rails applications.

## Installation

```ruby
gem 'simple_table_for', '~> 0.2.0'
```

## Usage

```erb
<%= table_for @posts, %w[Title Text Date Comments\ count -] do |post| %>
  <%= field post.title %>
  <%= field post.text %>
  <%= field post.created_at %>
  <%= field post.comments.count %>
  <%= field link_to('View', post) %>
<% end %>
```

You can optionally add an id or classes to tables and fields:

```erb
<%= table_for @posts, %w[Title -], id: 'posts-table', class: 'table' do |post| %>
  <%= field post.title, class: 'post-title' %>
  <%= field link_to('View', post), class: 'view' %>
<% end %>
```

# Setting default options

You can also set a default class for tables:

```ruby
# application.rb
class Application < Rails:Application
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
