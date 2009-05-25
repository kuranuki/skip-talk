class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  def index
    @messages = Message.recent

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message was successfully created.'
        format.html { redirect_to(messages_url) }
        format.xml  { render :xml => @message, :status => :created, :location => messages_url(:anchor => @message.id) }
        format.js   { render :json => @message.to_json, :status => :created, :location => messages_url(:anchor => @message.id) }

      else
        format.html { render :action => "new" }
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

end
