require 'minitest/autorun'
require_relative 'phone_number'
 
class PhoneNumberTest < MiniTest::Unit::TestCase
  def setup; end
 
  # def test_method_1
    # assert_equal(expected, actual)
    # assert_empty []
    # assert_includes collection, obj
    # assert_instance_of klass, obj
    # refute_*
  # end
 
  def test_cleans_number
    p_number = PhoneNumber.new('(123) 456-7890')
    assert_equal('1234567890', p_number.number)
  end
 
  def test_display_number
    p_number = PhoneNumber.new('1234567890')
    assert_equal('(123) 456-7890', p_number.to_s)
  end

  def test_any_number_that_has_non_numerics_is_invalid
    p_number = PhoneNumber.new('A0123456789')
    assert_equal(true, p_number.valid?)
  end

  def test_number_that_has_10_numerics_is_valid
    p_number = PhoneNumber.new('1234567890')
    assert_equal(true, p_number.valid?)
  end

  def test_number_less_than_ten_numerics_is_invalid
    p_number = PhoneNumber.new('0')
    assert_equal(false, p_number.valid?)
  end

  def test_number_that_has_greater_than_11_numerics_is_invalid
    p_number = PhoneNumber.new('0101234567890')
    assert_equal(false, p_number.valid?)
  end

  def test_number_that_has_11_numerics_and_begins_with_1_is_valid
    p_number = PhoneNumber.new('11234567890')
    assert_equal(true, p_number.valid?)
  end

  def test_number_that_has_11_numerics_and_does_not_begin_with_1_is_invalid
    p_number = PhoneNumber.new('90123456789')
    assert_equal(false, p_number.valid?)
  end
end
