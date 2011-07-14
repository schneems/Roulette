class Roulette::Transaction
  attr_accessor :args, :store, :method

  def initialize(options = {})
    self.store = options[:store]
    self.args = *options[:args]
    self.method = options[:method]
  end

  def fire(method_name = nil )
    method_to_fire = (method_name||method).to_sym
    store.send method_to_fire, *args
  end
end