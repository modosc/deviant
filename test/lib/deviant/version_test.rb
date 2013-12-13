require_relative '../../test_helper'

describe Deviant do

  it "must be defined" do
    Deviant::VERSION.wont_be_nil
  end

end
