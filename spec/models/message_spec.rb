require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Message, ".tree" do
  before do
    @messages = (1..5).map{ |i| Message.create(:content => "content #{i}") }
  end
  describe "ネスト構造の中のIDが渡されたとき" do
=begin
 ------- 0
  |----- 1
    |--- 2
    |--- 3 <=
      |- 4
 ------- 5
=end
    before do
      @messages[1].move_to_child_of @messages[0]
      @messages[2].move_to_child_of @messages[1]
      @messages[3].move_to_child_of @messages[1]
      @messages[4].move_to_child_of @messages[3]
    end
    it "ネスト構造を取得する" do
      Message.tree(@messages[3]).size.should == 5
      Message.tree(@messages[3]).map(&:id).should == @messages[0..4].map(&:id)
    end
  end
end
