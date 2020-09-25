class TasksController < ApplicationController
  def index
    @tasks = Task.all.order('runtime DESC')
  end

  def new
  end

  def create
    @task = Task.new(task_params)
    @task.checked = false
  end

  private
  def task_params
    params.require(:task).permit(:runtime, :place, :todo)
  end

end
