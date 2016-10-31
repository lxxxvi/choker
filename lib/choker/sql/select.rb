class Choker::Sql::Select < Choker::Sql
  def self.select_count_sql(table_name)
    sql('SELECT count(*) FROM ?', table_name)
  end
end
