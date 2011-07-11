require 'spec_helper'
class FakeKeyValueStore

end


describe Roulette::Transaction do
    before do
      @kv_store = FakeKeyValueStore.new
      @key = "key"
      @args = [@key, "value"]
    end

    describe '#new' do
      it "keeps args, stores, and key" do
        transaction = Roulette::Transaction.new([@kv_store], *@args)
        transaction.stores.should eq([@kv_store])
        transaction.key.should eq(@key)
        transaction.args.should eq(@args)
      end
    end

    describe '#extract_key' do
      it "pulls out the key even if there is only one arg" do
        key = "foo"
        transaction = Roulette::Transaction.new([], key)
        transaction.extract_key.should eq(key)
      end

      it "pulls out the key" do
        transaction = Roulette::Transaction.new([], *@args)
        transaction.extract_key.should eq(@key)
      end
    end

    describe '#select_store' do
      it "picks a store" do
        transaction = Roulette::Transaction.new([@kv_store], *@args)
        store = transaction.send :select_store
        store.should eq(@kv_store)
      end

      it "selects different stores for different keys" do
        @kv_store_deux = FakeKeyValueStore.new
        store = Roulette::Transaction.new([@kv_store, @kv_store_deux], "key").send :select_store
        store_deux = Roulette::Transaction.new([@kv_store, @kv_store_deux], "different_key").send :select_store
        store.should_not eq(store_deux)
      end
    end

    describe "#fire" do
      it "sends a method to a kv_store" do
        fired_method = :sadd
        @kv_store.should_receive(fired_method)
        transaction = Roulette::Transaction.new([@kv_store], *@args)
        transaction.fire(fired_method)
      end
    end
end