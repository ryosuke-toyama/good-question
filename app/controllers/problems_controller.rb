class ProblemsController < ApplicationController

  def index
    @problem = Problem.new
    @room = Room.find(params[:room_id])
    @problems = @room.problems.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @problems = @room.problems.all
    @problem = @room.problems.new(problem_params)
    respond_to do |format| 
      if @problem.save 
        ActionCable.server.broadcast 'room_channel', problem: @problem 
        format.html { redirect_to room_problems_path(room) } 
        format.json { render 'index.json', status: :created, location: @problem } 
        format.js 
      else 
        format.html { render :index } 
        format.json { render json: @problem.errors, status: :unprocessable_entity } 
      end 
    end 
  end

  def destroy
  end

  private
  def problem_params
    params.require(:problem).permit(:content, :image).merge(user_id: current_user.id)
  end
end