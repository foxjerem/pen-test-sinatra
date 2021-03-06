class PayloadSet

  attr_reader   :param_key
  attr_accessor :param_values

  def initialize(param_key, param_values = [])
    @param_key = param_key
    @param_values = param_values
  end

  def size
    param_values.count
  end

  def add_values(param_values)
    @param_values += param_values
    self
  end

  def add_values_from_file(filepath)
    @param_values += File.read(filepath).split("\n")
    self
  end

  def add_values_from_function(function, count)
    @param_values += (0...count).map{ self.class.send(function) }
    self
  end

  def self.generate_cookie
    (1..64).map{ [('0'..'9').to_a, ('a'..'z').to_a, ('A'..'Z').to_a ].flatten.sample }.join
  end

end