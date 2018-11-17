class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # je vais dans la vue Task/index.html.erb
    # raise
  end

  def show
    # raise
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    Task.create!(
      params.require(:task).permit(:title, :details)
    )
    redirect_to tasks_path
    # Task.create!(param[:title], params[:details])
  end

  def edit
    # raise
    @task = Task.find(params[:id])
  end

  def update
      # raise
      @task = Task.find(params[:id])
      @task.update!(
      params.require(:task).permit(:title, :details, :completed)
    )
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!
    redirect_to tasks_path
  end
end
