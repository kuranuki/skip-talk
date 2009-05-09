require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/show.html.erb" do
  include MessagesHelper
  before(:each) do
    assigns[:message] = @message = stub_model(Message,
      :content => "value for content"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ content/)
  end
end

