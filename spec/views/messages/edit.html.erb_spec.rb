require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/edit.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:message] = @message = stub_model(Message,
      :new_record? => false,
      :content => "value for content"
    )
  end

  it "renders the edit message form" do
    render
    
    response.should have_tag("form[action=#{message_path(@message)}][method=post]") do
      with_tag('textarea#message_content[name=?]', "message[content]")
    end
  end
end


