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
        transaction = Roulette::Transaction.new(:store => @kv_store, :args => @args)
        transaction.store.should eq(@kv_store)
        transaction.args.should eq(@args)
      end
    end

    describe "#fire" do
      it "sends a method to a kv_store" do
        fired_method = :sadd
        @kv_store.should_receive(fired_method)
        transaction = Roulette::Transaction.new(:store => @kv_store, :args => @args)
        transaction.fire(fired_method)
      end
    end
end