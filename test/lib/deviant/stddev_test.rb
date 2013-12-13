require_relative '../../test_helper'

describe Deviant do
  before do
    @d = Deviant.new
  end

  describe "when shifting values on" do
    it "must handle Arrays" do
      @d << [1,2,3]
      @d.n.must_equal 3
    end
    it "must handle Fixnums" do
      @d << 1
      @d.n.must_equal 1
    end
    it "must handle Floats" do
      @d << 1.0
      @d.n.must_equal 1
    end
    it "must handle Strings" do
      @d << "1"
      @d.n.must_equal 1
    end
  end


end
