# Roulette.config([Redis.new(..), Redis.new(...)])
#
# r = Roulette.new([Redis.new(..), Redis.new(...)])
#
#
# Roulette.shard(:whatevs).sadd("key", "value")
# roulette = Roulette.new(REDIS, REDIS2, REDIS3, ...)
# roulette.set("key", "value")
# roulette.get("key")
# >> "value"

require 'digest/sha1'

class Roulette
  attr_accessor :stores

  def initialize(*stores)
    self.stores = stores.flatten
  end

  def method_missing(method_name, *args, &blk)
    Transaction.new(:args => args, :store => select_store(args), :method => method_name).fire
  end

  def extract_key(*args)
    args.flatten.first.to_s
  end

  def select_store(*args)
    key = extract_key(*args)
    store_for_key(key)
  end

  def store_for_key(key)
    val = Digest::SHA1.hexdigest(key).unpack('Q').join.to_i
    store_index = val % stores.count
    self.stores[store_index]
  end
end

require 'roulette/transaction'
