class NullRate
  def value
    0
  end

  def decorate
    "#{self.class}Decorator".constantize.new(self)
  end
end
