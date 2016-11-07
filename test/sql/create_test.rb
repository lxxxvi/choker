require 'test_helper'

module Choker
  class CreateTest < Minitest::Test
    def test_postgres_create_import_table_sql
      table = Choker::Table.new(artists_file)
      assert_equal 'CREATE TABLE choker_artists_csv ( artist_name VARCHAR(100) NULL, main_genre VARCHAR(100) NULL )', Choker::Sql::Create.create_table_sql(table)
    end

    private

    def artists_file
      Choker::File.new(Choker::FileTest::ARTISTS_PATH)
    end
  end
end
