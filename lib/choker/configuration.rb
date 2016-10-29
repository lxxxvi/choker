module Choker
  class Configuration
    attr_accessor :database_engine

    SUPPORTED_DATABASE_ENGINES = %i(postgres mysql).freeze

    DEFAULT_DATABASE_ENGINE = :postgres

    def initialize
      self.database_engine = DEFAULT_DATABASE_ENGINE
    end
  end
end
