require 'test_helper'

class MongodbForOmioTest < Test::Unit::TestCase

  context "MongodbForOmio" do
    context "getting the index" do
      setup do
        get '/'
      end

      should "respond" do
        assert body
      end
    end
  end

end