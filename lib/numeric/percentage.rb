class Numeric

  def percentage
    self.perc
  rescue
    'Error: arguments'
  end

  def sqrt
    self.math_sqrt
  rescue
    'Error: arguments'
  end

  def math_sqrt
    Math.sqrt(self)
  end

  def perc
    self / 100.0
  end

end
