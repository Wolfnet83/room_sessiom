class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name))
    if @room.save
      redirect_to @room, notice: 'Room created'
    else
      render 'new'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def update
  end

  def show
    @room = Room.find(params[:id])
    @room_sessions = @room.sessions.all
  end

end
