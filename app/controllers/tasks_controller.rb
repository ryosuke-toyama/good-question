class TasksController < ApplicationController

  def index
    @tasks = Task.all.order('runtime ASC')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.runtime == nil
      @task.runtime = Date.today
    end
    @task.checked = false
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.valid?
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  def checked
    task = Task.find(params[:id])
    if task.checked
      task.update(checked: false)
    else
      task.update(checked: true)
    end

    task_content = Task.find(params[:id])
    render json: { task: task_content}
  end

  private
  def task_params
    params.require(:task).permit(:runtime, :place, :todo)
  end

end

