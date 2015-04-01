module SimpleTableFor
  class Defaults
    def self.get
      @defaults || {}
    end

    def self.set(options)
      @defaults = options
    end
  end
end
