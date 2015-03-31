module SimpleTableFor
  module Helpers
    # Creates a table field
    # See table for details
    def field(content, options = {})
      content_tag :td, content, id: options[:id], class: options[:class]
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

      content_tag :table, id: options[:id], class: options[:class] do
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

  # This class handles the default options
  class Defaults
    # Get de default options
    def self.get
      @defaults || defaults
    end

    # Set the default options
    #   SimpleTableFor::Defaults.set id: 'id', class: 'class'
    def self.set(options)
      @defaults = defaults.merge options
    end

    private
      def self.defaults
        {id: '', class: ''}
      end
  end
end

ActionView::Base.send :include, SimpleTableFor::Helpers if defined? ActionView::Base
