module Choker
  class Importer
    attr_accessor :source_file
    attr_accessor :target_table
    def initialize(path, options = {})
      @source_file = Choker::File.new(path, options)
      @target_table = Choker::Table.new(@source_file, options)
    end

    def import
      # drop_table_if_exist
      # create_table
      # import file
      # run checks
    end
  end
end
