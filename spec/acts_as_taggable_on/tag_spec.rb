require File.dirname(__FILE__) + '/../spec_helper'

describe Tag do
  before(:each) do
    @tag = Tag.new
    @user = TaggableModel.create(:name => "Pablo")  
  end
  
  it "should require a name" do
    @tag.should_not be_valid
    @tag.should have(1).error
    @tag.name = "something"
    @tag.should be_valid
  end
  
  it "should be able to look up a tag with name having escape sequences" do
    @tag.name = name = '"\x3c'
    @tag.save!
    Tag.should_receive(:create).never
    Tag.find_or_create_with_eq_by_name(name).should == @tag
  end

  it "should be able to look up a tag with name having escape sequences[EVEN WITH MYSQL]" do
    with_mysql do
      @tag.name = name = '"\x3c'
      @tag.save!
      Tag.should_receive(:create).never
      Tag.find_or_create_with_eq_by_name(name).should == @tag
    end
  end
  
  it "should equal a tag with the same name" do
    @tag.name = "awesome"
    new_tag = Tag.new(:name => "awesome")
    new_tag.should == @tag
  end
  
  it "should return its name when to_s is called" do
    @tag.name = "cool"
    @tag.to_s.should == "cool"
  end
end
