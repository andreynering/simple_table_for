module SimpleTableFor
  class Railtie < Rails::Railtie
    config.simple_table_for = ActiveSupport::OrderedOptions.new
    config.simple_table_for.defaults = ActiveSupport::OrderedOptions.new

    config.after_initialize do |app|
      Defaults.set app.config.simple_table_for.defaults
    end
  end
end
