module Choker
  class Configuration
    attr_accessor :database_engine
    attr_accessor :import_table_name_prefix

    SUPPORTED_DATABASE_ENGINES = %i(postgres mysql).freeze

    DEFAULT_IMPORT_TABLE_NAME_PREFIX = 'choker_'.freeze
    DEFAULT_DATABASE_ENGINE = :postgres

    def initialize
      self.database_engine = DEFAULT_DATABASE_ENGINE
      self.import_table_name_prefix = DEFAULT_IMPORT_TABLE_NAME_PREFIX
    end
  end
end
