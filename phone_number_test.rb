require 'minitest/autorun'
require './phone_number'
 
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
 
  def test_display_number_string_input
    p_number = PhoneNumber.new('1234567890')
    assert_equal('(123) 456-7890', p_number.pretty_output)
  end

  def test_display_number_numeric_input
    p_number = PhoneNumber.new(1234567890)
    assert_equal('(123) 456-7890', p_number.pretty_output)
  end
  
  def test_any_number_that_has_non_numerics_is_invalid
    skip
    p_number = PhoneNumber.new('A0123456789')
    assert_equal(false, p_number.valid?)
  end

  def test_number_that_has_10_numerics_is_valid
    skip
    p_number = PhoneNumber.new('1234567890')
    assert_equal('1234567890', p_number.valid?)
  end

  def test_number_less_than_ten_numerics_is_invalid
    skip
    p_number = PhoneNumber.new('0')
    assert_equal(false, p_number.valid?)
  end

  def test_number_that_has_greater_than_11_numerics_is_invalid
    skip
    p_number = PhoneNumber.new('0101234567890')
    assert_equal(false, p_number.valid?)
  end

  def test_number_that_has_11_numerics_and_begins_with_1_is_valid
    skip
    p_number = PhoneNumber.new('12345678901')
    assert_equal(true, p_number.valid?)
  end

  def test_number_that_has_11_numerics_and_does_not_begin_with_1_is_invalid
    skip
    p_number = PhoneNumber.new('92345678901')
    assert_equal(false, p_number.valid?)
  end
  
  def test_valid_npa_from_valid_number
    skip
    p_number = PhoneNumber.new('2345678901')
    assert_equal('234', p_number.npa) 
  end

  def test_invalid_npa_in_otherwise_valid_number
    skip
    p_number = PhoneNumber.new('1234567890')
    assert_equal(false, p_number.npa)
  end

  def test_valid_npa_in_valid_11_numeric_number
    skip
    p_number = PhoneNumber.new('12345678901')
    assert_equal('234', p_number.npa)
  end

  def test_valid_nxx_from_valid_number
    skip
    p_number = PhoneNumber.new('2345678901')
    assert_equal('567', p_number.nxx)
  end

  def test_invalid_nxx_in_otherwise_valid_number
    skip
    p_number = PhoneNumber.new('2341234567')
    assert_equal(false, p_number.nxx)
  end

  def test_valid_nxx_in_valid_11_numeric_number
    skip
    p_number = PhoneNumber.new('12345678901')
    assert_equal('567', p_number.nxx)
  end

  def test_nxx_with_last_two_numbers_as_1_is_invalid
    skip
    p_number = PhoneNumber.new('2345118901')
    assert_equal(false, p_number.nxx)
  end

  def test_subscriber_number_is_valid
    skip
    p_number = PhoneNumber.new('2345678901')
    assert_equal('8901', p_number.subscriber)
  end
end
