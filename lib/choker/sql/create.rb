module Choker
  class Sql::Create < Choker::Sql
    def self.create_table_sql(choker_table)
      raise :argument_is_not_choker_table unless choker_table.kind_of?(Choker::Table)
      @choker_table = choker_table
      postgres_create_import_table_sql if Choker.configuration.database_engine == :postgres
    end

    def self.postgres_create_import_table_sql
      sql("CREATE TABLE ? ( #{postgres_column_definitions} )", @choker_table.table_name)
    end

    private 

    def self.postgres_column_definitions
      @choker_table.column_names.map { |column_name| sql('? VARCHAR(100) NULL', column_name.to_s) }.join(', ')
    end

  end
end
