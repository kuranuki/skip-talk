require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessagesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "messages", :action => "index").should == "/messages"
    end
  
    it "maps #new" do
      route_for(:controller => "messages", :action => "new").should == "/messages/new"
    end
  
    it "maps #show" do
      route_for(:controller => "messages", :action => "show", :id => "1").should == "/messages/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "messages", :action => "edit", :id => "1").should == "/messages/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "messages", :action => "create").should == {:path => "/messages", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "messages", :action => "update", :id => "1").should == {:path =>"/messages/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "messages", :action => "destroy", :id => "1").should == {:path =>"/messages/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/messages").should == {:controller => "messages", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/messages/new").should == {:controller => "messages", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/messages").should == {:controller => "messages", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/messages/1").should == {:controller => "messages", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/messages/1/edit").should == {:controller => "messages", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/messages/1").should == {:controller => "messages", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/messages/1").should == {:controller => "messages", :action => "destroy", :id => "1"}
    end
  end
end
