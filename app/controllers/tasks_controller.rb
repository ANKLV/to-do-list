class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :destroy, :edit]
  before_action :set_task, only: [:new, :create]

  def index
    @tasks = by_completed_tasks(false)
    @completed_tasks = by_completed_tasks(true)
  end

  def new
  end

  def show
  end

  def create
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render new_task_path
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render edit_task_path(@task)
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def by_completed_tasks(value)
    current_user.tasks.by_completed(value).search(params[:search]).order(updated_at: :desc)
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end

  def find_task
    @task = current_user.tasks.find(params[:id])
  end

  def set_task
    @task = current_user.tasks.new
  end
end
