class TasksController < ApplicationController

  def index
    @tasks = Task.where(completed: false).oeder('udated_at')
    @completed_tasks = Task.where(completed:true).order('udated_at')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params
    @task.save
    redirect_to task_path
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes task_params
    redirect_to task_path
  end

  def complete
    @task = Task.find params[:id]
    @task.complete!
    redirect_to task_path
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit([:title, :completed])
  end

end
