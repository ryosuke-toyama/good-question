class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end

  end

  def destroy
  end

  private
  def room_params
    params.require(:room).permit(:room_name, user_ids: [])
  end
end