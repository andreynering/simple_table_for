require_relative 'simple_table_for/defaults'
require_relative 'simple_table_for/rails'
require_relative 'simple_table_for/helpers'

ActionView::Base.send :include, SimpleTableFor::Helpers if defined? ActionView::Base
