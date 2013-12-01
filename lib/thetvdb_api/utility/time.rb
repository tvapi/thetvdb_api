class Time
  def self.coerce(value)
    begin
      Time.parse(value)
    rescue
      Time.at(value.to_i)
    end
  end
end
