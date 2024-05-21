class TasksController < ApplicationController
  before_action :get_task_by_id, only: [:edit, :update, :show, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @newTask = Task.new(task_params)
    @newTask.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def get_task_by_id
    @task = Task.find(params[:id])
  end
end
