require 'spec_helper'
class FakeKeyValueStore

end

describe Roulette::EachStore do
    before do
      @key = "key"
      @args = [@key, "value"]
      @stores = [FakeKeyValueStore.new, FakeKeyValueStore.new]
    end

    describe '#new' do
      it "keeps stores" do
        each_store = Roulette::EachStore.new(@stores)
        each_store.stores.should eq(@stores)
      end
    end

    describe "#method_missing" do
      it "sends any method to all stores" do
        fired_method = :sadd
        @stores.each do |store|
          store.should_receive(fired_method).with(@args)
        end
        Roulette::EachStore.new(@stores).send fired_method, *@args
      end
    end
end