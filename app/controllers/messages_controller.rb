class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  def index
    @messages = if since_id = params[:since_id]
                  Message.since(since_id)
                else
                  Message.recent.reverse
                end
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @messages }
      format.js  { render :json => @messages.map{|m| message_to_json(m)} }
    end
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    respond_to do |format|
      if @message.save
        if parent_id = params[:message][:parent_id] and parent = Message.find_by_id(parent_id)
          @message.move_to_child_of parent
        end
        flash[:notice] = 'Message was successfully created.'
        format.html { redirect_to(messages_url) }
        format.xml  { render :xml => @message, :status => :created, :location => messages_url(:anchor => @message.id) }
        format.js   { render :json => message_to_json(@message), :status => :created, :location => messages_url(:anchor => @message.id) }
      else
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
        format.js   { render :json => @message.errors.to_json, :status => :unprocessable_entity }
      end
    end
  end

  def archive
    @messages = Message.paginate(paginate_option)
    respond_to do |format|
      format.html
    end
  end

  private
  def paginate_option
    { :page => params[:page],
      :order => "messages.updated_at DESC",
      :per_page => params[:per_page] || 10,
    }
  end

  def message_to_json(message)
    returning({}) do |h|
      h[:updated_at] = message.updated_at.to_s(:db)
      h[:created_at] = message.created_at.to_s(:db)
      h[:content] = SkipTalkParser.to_html message.content
      h[:id] = message.id
      h[:parent_id] = message.parent_id
      h[:level] = message.level
      h[:root_id] = message.root.id
    end
  end

end
