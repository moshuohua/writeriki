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
    redirect_to "http://127.0.0.1:3000/messages"
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = current_user.messages.find(params[:id])
    if @message.destroy
      flash[:notice] = "All ok"
    else
      flash[:error] = "Fail"
    end

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  def outbox
    @messages = current_user.sent_messages
  end

  def allbox
    @messages = current_user.messages
  end

  def trash
    @messages = current_user.deleted_messages
  end

  def restore
    current_user.deleted_messages.process do |m|
      m.restore # @alice restore 'm' message from trash
    end
  end

end
