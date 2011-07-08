require 'spec_helper'
class FakeKeyValueStore
  
end


describe Roulette do
    describe 'method missing' do
      before do
        @kv_store = FakeKeyValueStore.new
        @roulette = Roulette.new(@kv_store)
      end
      
      it 'passes, key and value to the stored KV_store' do
        @kv_store.should_receive(:sadd).with("foo", "bar")
        @roulette.sadd("foo", "bar")
      end
      
      it 'passes, key and value to the stored KV_store' do
        @kv_store.should_receive(:sadd).with("foo", "bar")
        @roulette.sadd("foo", "bar")
      end
      
      it 'passes key to the stored KV_store' do
        @kv_store.should_receive(:scard).with("foo")
        @roulette.scard("foo")
      end
      
      it 'passes arbitrary number of elements to the stored KV_store' do
        @kv_store.should_receive(:fake_method).with(1,2,3,4,5,6,7,8,9,0)
        @roulette.fake_method(1,2,3,4,5,6,7,8,9,0)
      end
    end
end