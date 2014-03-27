class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def new
    @session = Session.new
  end

  def create
    @session = room.sessions.new(params.require(:session).permit(:begin_time, :end_time))
    if @session.save
      redirect_to @session, notice: 'Session for room created'
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
end
