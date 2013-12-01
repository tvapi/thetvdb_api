class Date
  def self.coerce(value)
    begin
      Date.parse(value)
    rescue => e
      nil
    end
  end
end
