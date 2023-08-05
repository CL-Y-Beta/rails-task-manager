class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  def update
    @task = Task.find(params[:id])
    if params[:task][:completed] == "1"
      @task.completed = true
    else
      @task.completed = false
    end
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  private
  def task_params
    params.require(:task).permit(:title, :details)
  end

end
