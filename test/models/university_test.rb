require 'test_helper'

class UniversityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  it "fails because no password" do
    University.new({:username => "hans"}).save.should be_false
  end

  it "fails because password is too short" do
    University.new({:username => "hans",
      :password => 'han'}).save.should be_false
  end

  it "succeeds because password is long enough" do
    University.new({:username => "hans",
      :password => 'hansohanso'}).save.should be_true
  end

end
