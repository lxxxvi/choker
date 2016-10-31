class Choker::Sql
  def self.sql(query_string, *args)
    query_pieces = "#{query_string};".split('?')[0..-2]
    raise :substition_count_mismatch if (query_pieces.count - args.count) != 0

    safe_args = args.map { |arg| clean(arg) }

    query_pieces.zip(safe_args).flatten.compact.join
  end

  private

  def self.clean(string)
    string.gsub(/(;|\-\-|\/\*)/, '')
  end
end

require_relative 'sql/select'
