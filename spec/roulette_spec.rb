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

    describe 'stores' do
      before do
        @kv_store = FakeKeyValueStore.new
      end

      it 'passes multiple stores into a single array (doesn make an array of an array)' do
        store_array = [@kv_store, @kv_store, @kv_store]
        @roulette = Roulette.new(store_array)
        @roulette.stores.should eq(store_array)
      end
    end
    

     describe '#extract_key' do
       before do
         @kv_store = FakeKeyValueStore.new
         @roulette = Roulette.new(@kv_store)
       end

       it "pulls out the key even if there is only one arg" do
         key = "foo"
         @roulette.extract_key(key).should eq(key)
       end
     
       it "pulls out the key" do
         key = "foo"
         @roulette.extract_key([key, "some", "other", "stuff"]).should eq(key)
       end
     end
     
     describe '#select_store' do
       before do
         @kv_store = FakeKeyValueStore.new
         @roulette = Roulette.new(@kv_store)
       end
       
       it "picks a store" do
         @roulette.select_store("key").should eq(@kv_store)
       end
     
       it "selects different stores for different keys" do
         @kv_store_deux = FakeKeyValueStore.new
         multiple_store_roulette = Roulette.new([@kv_store, @kv_store_deux])
         store = multiple_store_roulette.select_store("key")
         store_deux = multiple_store_roulette.select_store("different_key")
         store.should_not eq(store_deux)
       end
     end
    
end