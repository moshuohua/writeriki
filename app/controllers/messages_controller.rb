class MessagesController < ApplicationController

  before_filter :authenticate_user!

  # GET /messages
  # GET /messages.json
  def index
    @messages = current_user.messages

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = current_user.messages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  def reply
    
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    @to = User.find(params[:message][:to])
    current_user.send_message(@to, params[:message][:topic], params[:message][:body])
    redirect_to messages_url
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    #@message = Message.find(params[:id])
    #@message.destroy
    #redirect_to projects_path
    current_user.delete_message(ActsAsMessageable::Message.find(params[:id]))
    redirect_to messages_url
  end

  def outbox
    @messages = current_user.sent_messages
  end

  def inbox
    @messages = current_user.received_messages
  end

  def trash
    @messages = current_user.deleted_messages
  end

  def restore
    current_user.deleted_messages.process do |m|
      m.restore # @alice restore 'm' message from trash
    end
    redirect_to messages_url
  end

end
