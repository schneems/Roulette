
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
    self.stores = stores
  end

  def method_missing(method_name, *args, &blk)
    Transaction.new(@stores, *args).fire(method_name)
  end

  class Transaction
    attr_accessor :key, :args, :stores

    def initialize(stores, *args)
      self.stores = stores
      self.args = *args
      extract_args
    end

    def extract_args
      self.key = args.first.to_s
    end

    def fire(method)
      select_store.send method.to_sym, *args
    end

    private
    def select_store
      val = Digest::SHA1.hexdigest(self.key).unpack('Q').join.to_i
      store_index = val % stores.count
      @stores[store_index]
    end
  end

end