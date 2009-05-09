require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/index.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:messages] = [
      stub_model(Message,
        :content => "value for content"
      ),
      stub_model(Message,
        :content => "value for content"
      )
    ]
  end

  it "renders a list of messages" do
    render
    response.should have_tag("tr>td", "value for content".to_s, 2)
  end
end

