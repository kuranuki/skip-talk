require "erb"

class SkipTalkParser
  extend ActionView::Helpers::TextHelper
  extend ActionView::Helpers::TagHelper
  extend ERB::Util

  def self.to_html(text)
    return "" if text.empty?
    text = h(text)
    text = replace_br(text)
#    text = auto_link(text)
  end

  def self.replace_br(text)
    text.gsub!( /\r\n?/, "\n" )
    text.sub!( /\n*\z/, "\n\n" )
    text_arr = text.split("\n")
    text_arr.join("<br/>")
  end

end
