module SimpleTableFor
  module Helpers
    def field(content, options = {})
      <<-TD.html_safe
        <td id='#{options[:id]}' class='#{options[:class]}'>
          #{content}
        </td>
      TD
    end

    # Usage:
    #   <%= table_for @posts, %w[Title Text Date Comments\ count -] do |post| %>
    #     <%= field post.title %>
    #     <%= field post.text %>
    #     <%= field post.date %>
    #     <%= field post.comments.count %>
    #     <%= field link_to('View', post) %>
    #   <% end %>
    def table_for(collection, heads, options = {})
      heads = heads.map{|h| "<th>#{h}</th>".html_safe }.join('')

      rows = collection.map do |obj|
        "<tr>#{capture{ yield obj }}</tr>".html_safe
      end.join('')

      options = Defaults.get.merge options

      <<-TABLE.html_safe
        <table id='#{options[:id]}' class='#{options[:class]}'>
          <thead>
            <tr>
              #{heads}
            </tr>
          </thead>

          <tbody>
            #{rows}
          </tbody>
        </table>
      TABLE
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
