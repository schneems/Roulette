class Roulette::EachStore
  attr_accessor :stores
  
  def initialize(stores)
    self.stores = stores
  end
  
  def method_missing(method_name, *args, &blk)
    stores.collect do |store|
      store.send method_name, *args
    end
  end
end