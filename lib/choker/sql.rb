module Choker
  class Sql
    def self.sql(query_string, *args)
      query_pieces = "#{query_string};".split('?')
      raise :substition_count_mismatch unless (query_pieces.count - args.count) == 1

      safe_args = args.map { |arg| clean_sql(arg) }

      query_pieces.zip(safe_args).flatten.compact.join.gsub(/;$/, '')
    end

    def self.column_names(string)
      columns = CSV.parse(string).first
      columns.map { |column| clean_column_name(column).to_sym }
    end

    def self.tablenameize(string)
      string.tr!('.', '_')
      string = clean_sql(string)
      string.gsub(/[^0-9a-z_]/, '')
    end

    private

    def self.clean_sql(string)
      string.gsub(%r{(;|\-\-|\/\*)}, '')
    end

    def self.clean_column_name(string)
      return if string.nil?
      string = string.downcase
      string = string[/[a-z].*/] # column names may only start with a letter
      string.tr!(' ', '_') # replace spaces with underlines
      string.gsub(/[^0-9a-z_]/, '') # remove any non-alphanumeric/underline characters
    end
  end
end

require_relative 'sql/select'
require_relative 'sql/drop'
require_relative 'sql/create'
