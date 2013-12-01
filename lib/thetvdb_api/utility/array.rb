class Array
  def self.coerce(value)
    value.to_s.split('|').reject { |element| element.empty? }
  end
end
