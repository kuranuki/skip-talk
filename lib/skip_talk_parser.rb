require "erb"

class SkipTalkParser
  def self.to_html(text)
    return "" if text.empty?
    text = ERB::Util.h(text)
    text.gsub!( /\r\n?/, "\n" )
    text.sub!( /\n*\z/, "\n\n" )
    text_arr = text.split("\n")
    text_arr.join("<br/>")
  end
end
