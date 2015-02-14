class PhoneNumber
  def initialize(num)
    @number = num
  end

  def number
    @number.gsub(/[^0-9]/, '')
  end

  def pretty_output
    first = @number.to_s.chars.slice(0..2).join
    second = @number.to_s.chars.slice(3..5).join
    third = @number.to_s.chars.slice(6..10).join
    "(#{first}) #{second}-#{third}"
  end
end
