require 'csv'

module Choker
  class File
    SUPPORTED_FILE_TYPES = %i(csv).freeze

    def initialize(path, options = {})
      raise "File '#{path}' does not exist"   unless ::File.exist?(path)
      raise "File '#{path}' is not readable"  unless ::File.readable?(path)
      @path = path
      raise "File '#{path}' is not supported" unless supported_file_type?
      @options = options
    end

    def supported_file_type?
      file_type = ::File.extname(@path)[1..-1].to_sym
      SUPPORTED_FILE_TYPES.include?(file_type)
    end

    def line_count
      ::File.foreach(@path).count
    end

    def first_row_column_names
      return unless first_row_is_header?
      @first_row_columns ||= Choker::Sql.column_names(first_row_from_file)
    end

    def first_row_is_header?
      @first_row_is_header ||= read_first_row_is_header_option
    end

    def column_count
      CSV.parse(first_row_from_file).first.count
    end

    private

    def read_first_row_is_header_option
      !(@options.dig(:first_row_is_header) == false) # nil => true (default), false => false, true => true
    end

    def first_row_from_file
      @first_row ||= ::File.open(@path) { |f| f.readline.chomp }
    end
  end
end
