module SimpleTableFor
  module Helpers
    # Creates a table field
    # See table_for for details
    def field(content, options = {})
      content_tag :td, content, options
    end

    # Creates a table
    # Usage:
    #   <%= table_for @posts, %w[Title Text Date Comments\ count -] do |post| %>
    #     <%= field post.title %>
    #     <%= field post.text %>
    #     <%= field post.date %>
    #     <%= field post.comments.count %>
    #     <%= field link_to('View', post) %>
    #   <% end %>
    def table_for(collection, headers, options = {})
      options = Defaults.get.merge options

      content_tag :table, options do
        concat (content_tag :thead do
          content_tag :tr do
            headers.map do |header|
              concat(content_tag :th, header)
            end
          end
        end)

        concat (content_tag :tbody do
          collection.map do |obj|
            concat (content_tag :tr do
              capture{ yield obj }
            end)
          end
        end)
      end
    end
  end
end