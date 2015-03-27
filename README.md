= SimpleTableFor

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

This project uses MIT-LICENSE.
