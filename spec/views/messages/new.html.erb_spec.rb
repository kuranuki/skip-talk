require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/new.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:message] = stub_model(Message,
      :new_record? => true,
      :content => "value for content"
    )
  end

  it "renders new message form" do
    render
    
    response.should have_tag("form[action=?][method=post]", messages_path) do
      with_tag("textarea#message_content[name=?]", "message[content]")
    end
  end
end


