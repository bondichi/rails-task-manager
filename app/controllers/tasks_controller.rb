class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(user_params)
    # @task = Task.new(user_params)
    # @task.save!
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    params = user_params
    @task.title = params["title"]
    @task.details = params["details"]
    @task.completed = params["completed"]
    @task.save!
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def user_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
