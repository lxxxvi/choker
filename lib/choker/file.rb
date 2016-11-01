module Choker
  class File
    SUPPORTED_FILE_TYPES = %i(csv).freeze

    attr_accessor :header_row

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
      read_header_row unless options.dig(:header_row) == false
    end

    def read_header_row
      @header_row = ::File.open(@path) { |f| f.readline.chomp }
    end
  end
end
