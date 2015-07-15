module SimpleTableFor
  module Helpers
    # Generates a table field.
    # See table_for for details.
    def field(content, options = {})
      content_tag :td, content, options
    end

    # Generates a table.
    # Usage:
    #   <%= table_for @users, [:name, :email, 'Registration Date', 'Comments count', '-'], id: 'table-id', class: 'table-class' do |user| %>
    #     <%= field user.name %>
    #     <%= field user.email %>
    #     <%= field user.created_at %>
    #     <%= field user.comments.count %>
    #     <%= field link_to('View', user) %>
    #   <% end %>
    def table_for(collection, headers, options = {})
      options = Defaults.get.merge options

      content_tag :table, options do
        concat (content_tag :thead do
          content_tag :tr do
            headers.map do |header|
              case header
              when String
                concat(content_tag :th, header)
              when Symbol
                concat(content_tag :th, collection.model.human_attribute_name(header))
              end
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
