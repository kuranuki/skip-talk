require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SkipTalkParser do
  it "改行が含まれるとき、<br/>に置換すること" do
    SkipTalkParser.to_html("hoge\r\nfuga").should be_include("hoge<br/>fuga")
  end

  it "タグが含まれるとき、エスケープされていること" do
    SkipTalkParser.to_html("<b>bbbb</b>").should be_include("&lt;b&gt;bbbb&lt;/b&gt;")
  end

  it "最後に改行が含まれないこと" do
    SkipTalkParser.to_html("hoge").should_not == "hoge<br/>"
  end
end
