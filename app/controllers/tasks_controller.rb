class TasksController < ApplicationController
  def index
    @tasks = Task.all.order('runtime DESC')
  end

  def new
  end

  def create
    @task = Task.new(task_params)
    @task.checked = false
    if @task.save
      redirect_to root_path
    else
      render :new
    end

  end

  private
  def task_params
    params.permit(:runtime, :place, :todo)
  end

end

