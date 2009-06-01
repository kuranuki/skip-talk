require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessagesController do

  def mock_message(stubs={})
    @mock_message ||= mock_model(Message, stubs)
  end

  describe "GET index" do
    it "assigns all messages as @messages" do
      Message.should_receive(:find).with(:all).and_return([mock_message])
      get :index
      assigns[:messages].should == [mock_message]
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created message as @message" do
        Message.should_receive(:new).with({'these' => 'params'}).and_return(mock_message(:save => true))
        post :create, :message => {:these => 'params'}
        assigns[:message].should equal(mock_message)
      end
    end
  end
end
