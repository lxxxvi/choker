require 'choker/version'
require 'choker/configuration'
require 'choker/sql'

module Choker
  class << self
    def configure(options = {})
      options.each do |k, v|
        next unless configuration.respond_to?("#{k}=")
        configuration.send("#{k}=", v)
      end

      yield configuration if block_given?
    end

    def configuration
      @config ||= Choker::Configuration.new
    end

    def reset_to_defaults
      @config = Choker::Configuration.new
    end
  end
end
