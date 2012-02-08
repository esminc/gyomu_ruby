class Integer
  def ceil(offset)
    ((self + offset) * Rational(1, offset)).ceil * offset - offset
  end

  def floor(offset)
    (self * Rational(1, offset)).floor * offset
  end
end
