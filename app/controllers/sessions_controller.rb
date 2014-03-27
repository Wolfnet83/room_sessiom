class SessionsController < ApplicationController
  before_filter :find_room, only: [:new, :create]

  def index
    @sessions = Session.all
  end

  def new
    @session = @room.sessions.new
  end

  def create
    @session = @room.sessions.new(params.require(:session).permit(:begin_time, :end_time))
    if @session.save
      redirect_to @room, notice: 'Session for room created'
    else
      render 'new'
    end
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    redirect_to sessions_path
  end

  def update
  end

  def show
    @session = Session.find(params[:id])
  end

  private
  def find_room
    @room = Room.find params[:room_id]
  end
end
