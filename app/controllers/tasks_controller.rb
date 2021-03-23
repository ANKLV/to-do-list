class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :destroy, :edit]
  before_action :set_task, only: [:new, :create]

  def index
    @tasks = current_user.tasks.where(completed: false).order(updated_at: :desc)
    @completed_tasks = current_user.tasks.where(completed:true).order('updated_at')
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
    @task.update_attributes task_params
    redirect_to task_path
  end

  def complete
    @task.complete!
    redirect_to task_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

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
