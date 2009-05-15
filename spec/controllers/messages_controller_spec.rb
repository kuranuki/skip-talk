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

  describe "GET show" do
    it "assigns the requested message as @message" do
      Message.should_receive(:find).with("37").and_return(mock_message)
      get :show, :id => "37"
      assigns[:message].should equal(mock_message)
    end
  end

  describe "GET new" do
    it "assigns a new message as @message" do
      Message.should_receive(:new).and_return(mock_message)
      get :new
      assigns[:message].should equal(mock_message)
    end
  end

  describe "GET edit" do
    it "assigns the requested message as @message" do
      Message.should_receive(:find).with("37").and_return(mock_message)
      get :edit, :id => "37"
      assigns[:message].should equal(mock_message)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created message as @message" do
        Message.should_receive(:new).with({'these' => 'params'}).and_return(mock_message(:save => true))
        post :create, :message => {:these => 'params'}
        assigns[:message].should equal(mock_message)
      end

      it "redirects to the created message" do
        Message.stub!(:new).and_return(mock_message(:save => true))
        post :create, :message => {}
        response.should redirect_to(root_url(:anchor => assigns[:message].id))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved message as @message" do
        Message.stub!(:new).with({'these' => 'params'}).and_return(mock_message(:save => false))
        post :create, :message => {:these => 'params'}
        assigns[:message].should equal(mock_message)
      end

      it "re-renders the 'new' template" do
        Message.stub!(:new).and_return(mock_message(:save => false))
        post :create, :message => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT udpate" do

    describe "with valid params" do
      it "updates the requested message" do
        Message.should_receive(:find).with("37").and_return(mock_message)
        mock_message.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :message => {:these => 'params'}
      end

      it "assigns the requested message as @message" do
        Message.stub!(:find).and_return(mock_message(:update_attributes => true))
        put :update, :id => "1"
        assigns[:message].should equal(mock_message)
      end

      it "redirects to the message" do
        Message.stub!(:find).and_return(mock_message(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(message_url(mock_message))
      end
    end

    describe "with invalid params" do
      it "updates the requested message" do
        Message.should_receive(:find).with("37").and_return(mock_message)
        mock_message.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :message => {:these => 'params'}
      end

      it "assigns the message as @message" do
        Message.stub!(:find).and_return(mock_message(:update_attributes => false))
        put :update, :id => "1"
        assigns[:message].should equal(mock_message)
      end

      it "re-renders the 'edit' template" do
        Message.stub!(:find).and_return(mock_message(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested message" do
      Message.should_receive(:find).with("37").and_return(mock_message)
      mock_message.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the messages list" do
      Message.stub!(:find).and_return(mock_message(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(messages_url)
    end
  end

end
