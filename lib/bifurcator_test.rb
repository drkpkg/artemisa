require 'minitest/autorun'
require_relative 'bifurcator'

class BifurcatorTest < Minitest::Test

  def setup
  end

  def test_create_folder
    assert_equal true, Bifurcator.create_folder
  end

  def test_create_log
    actual_date_time = Time.new
    assert_equal "/tmp/artemisa/logs/log-#{actual_date_time.day}-#{actual_date_time.month}-#{actual_date_time.year}.log", Bifurcator.create_log
  end

  def test_write_log
    Bifurcator.create_log
    assert_equal nil, Bifurcator.write_log('Fulanito','Crear','Inventario')
  end

end