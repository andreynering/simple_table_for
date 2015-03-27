SimpleTableFor
==============

A simple helper to generate tables in Rails applications.

In your Gemfile:

```ruby
gem 'simple_table_for'
```

Parameters:

```ruby
table_for(record, headers, options, &block)
```

Usage:

```ruby
<%= table_for @posts, %w[Title Text Date Comments\ count -] do |post| %>
  <%= field post.title %>
  <%= field post.text %>
  <%= field post.date %>
  <%= field post.comments.count %>
  <%= field link_to('View', post) %>
<% end %>
```

You can optionaly add an id or classes to tables and fields:

```ruby
<%= table_for @posts, %w[Title -], id: 'posts-table', class: 'table' do |post| %>
  <%= field post.title, class: 'post-title' %>
  <%= field link_to('View', post), class: 'view' %>
<% end %>
```

This project uses MIT-LICENSE.
