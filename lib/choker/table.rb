module Choker
  class Table
    def initialize(file, options = {})
      @file = file
      @options = options
      validate
    end

    def column_names
      @columns ||= determine_column_names
    end

    def self.dummy_column_names(count)
      (1..count).map { |i| "column_#{i}".to_sym }
    end

    private

    def validate
      raise "Column count mismatch (file: #{@file.column_count}, given columns: #{column_names.count})" if column_count_mismatch?
      raise "Duplicate column names (#{duplicate_columns})" if duplicate_column_names?
    end

    def determine_column_names
      return @options.dig(:column_names)  if @options.dig(:column_names)
      return @file.first_row_column_names if @file.first_row_is_header?
      Choker::Table.dummy_column_names(@file.column_count)
    end

    def column_count_mismatch?
      @file.column_count != column_names.count
    end

    def duplicate_column_names?
      duplicate_columns.count > 0
    end

    def duplicate_columns
      column_names.group_by { |e| e }.select { |_k, v| v.size > 1 }.map { |k, v| { column_name: k, count: v.size } }
    end
  end
end
