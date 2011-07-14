class Roulette::Transaction
  attr_accessor :args, :store, :method

  def initialize(options = {})
    self.store = options[:store]
    self.args = *options[:args]
    self.method = options[:method]
  end

  def fire(method_name = nil )
    store.send (method_name||method).to_sym, *args
  end
end