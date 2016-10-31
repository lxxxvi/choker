require 'test_helper'

class Choker::ConfigurationTest < Minitest::Test
  def test_default_configuration
    Choker.reset_to_defaults
    assert_equal :postgres, Choker.configuration.database_engine
  end

  def test_custom_configuration
    Choker.configure(database_engine: :mysql)
    assert_equal :mysql, Choker.configuration.database_engine
  end
end
