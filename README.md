SimpleTableFor
==============

A simple helper to generate tables in Rails applications.

In your Gemfile:

```ruby
gem 'simple_table_for'
```

Parameters:

```ruby
table_for(collection, headers, options, &block)
```

Usage:

```erb
<%= table_for @posts, %w[Title Text Date Comments\ count -] do |post| %>
  <%= field post.title %>
  <%= field post.text %>
  <%= field post.date %>
  <%= field post.comments.count %>
  <%= field link_to('View', post) %>
<% end %>
```

You can optionaly add an id or classes to tables and fields:

```erb
<%= table_for @posts, %w[Title -], id: 'posts-table', class: 'table' do |post| %>
  <%= field post.title, class: 'post-title' %>
  <%= field link_to('View', post), class: 'view' %>
<% end %>
```

This project uses MIT-LICENSE.

## Contributing

1. Fork it ( https://github.com/andreynering/simple_table_for/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
