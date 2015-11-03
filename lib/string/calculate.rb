class String

  def calculate
    self.calc
  rescue ZeroDivisionError
    'Error: divided by zero'
  rescue SyntaxError, NameError
    'Error: arguments'
  end

  def calc; eval(self.convert_all_numbers_float); end

  def convert_all_numbers_float
    values = ['']
    index  = 0
    id     = 0

    (self.size + 1).times do |i|
      if self[i] =~ /\d|\./
        values[index]     ||= ''
        values[index][id] ||= ''
        values[index][id]   = self[i]
        id                 += 1
      else
        values[index] = values[index].to_f
        id            = 0
        index        += 2
        values        << self[i]
      end
    end

    values.compact.join
  end

end
