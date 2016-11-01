require 'csv'

module Choker
  class File
    SUPPORTED_FILE_TYPES = %i(csv).freeze

    attr_accessor :columns
    attr_accessor :first_row_is_header

    def initialize(path, options = {})
      raise "File '#{path}' does not exist"   unless ::File.exist?(path)
      raise "File '#{path}' is not readable"  unless ::File.readable?(path)
      @path = path
      raise "File '#{path}' is not supported" unless supported_file_type?
      read_options(options)
    end

    def supported_file_type?
      file_type = ::File.extname(@path)[1..-1].to_sym
      SUPPORTED_FILE_TYPES.include?(file_type)
    end

    def line_count
      lines = `wc -l #{@path}`[/ +([0-9]{1,})?/, 1]
      lines.to_i
    end

    private

    def read_options(options)
      read_first_row_is_header_option(options.dig(:first_row_is_header))
      read_columns_option(options.dig(:columns))
    end

    def read_first_row_is_header_option(option)
      return @first_row_is_header = true if option.nil?
      @first_row_is_header = option
    end

    def read_columns_option(option)
      return @columns = option unless option.nil?               # user sets custom column names

      first_line = ::File.open(@path) { |f| f.readline.chomp }
      @columns = column_names(first_line)
      @columns = dummy_column_names(@columns) if @first_row_is_header
    end

    def column_names(csv_string)
      csv_string = csv_string.downcase
      csv_string = csv_string[/[a-z].*/]              # column names may only start with a letter
      csv_string = csv_string.gsub(/ /, '_')          # replace spaces with underlines
      csv_string = csv_string.gsub(/[^0-9a-z_]/, '')  # remove any non-alphanumeric/unterline characters
      CSV.parse(csv_string).first.map(&:to_sym)
    end

    def dummy_column_names(a_row)
      (1..a_row.count).map { |i| "col_#{i}" }
    end
  end
end
