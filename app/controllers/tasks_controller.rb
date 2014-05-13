class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :toggle]

  def index
    @tasks_done = Task.where(completed: true).order(updated_at: :desc)
    @tasks = Task.where(completed: false).order(created_at: :asc)
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    @task.save
    redirect_to tasks_path
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def toggle
    @task.toggle!(:completed)
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed, :note)
  end
end
