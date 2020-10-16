class ProblemsController < ApplicationController

  def index
    @problem = Problem.new
    @room = Room.find(params[:room_id])
    @problems = @room.problems.includes(:user)
  end

  def create
  end

  def destroy
  end

end