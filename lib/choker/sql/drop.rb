module Choker
  class Sql::Drop < Choker::Sql
    def self.drop_table_sql(table_name, check_exists = false)
      sql("DROP TABLE #{if_exists_sql(check_exists)} ?", table_name)
    end

    def self.drop_table_if_exists_sql(table_name)
      Choker::Sql::Drop.drop_table_sql(table_name, true)
    end

    def self.if_exists_sql(required)
      'IF EXISTS' if required
    end
  end
end
