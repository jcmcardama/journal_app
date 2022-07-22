class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category, only: ['show', 'new', 'edit', 'create', 'update', 'destroy']

  def home
    @tasks = current_user.tasks.all
    @due_today = current_user.tasks.where("deadline BETWEEN ? AND ?", Time.now, Time.now.end_of_day)
    @overdue = current_user.tasks.where("deadline < ?", Time.now)
  end

  def urgent
    @tasks = current_user.tasks.where("deadline BETWEEN ? AND ?", Time.now, Time.now.end_of_day)
  end

  def overdue
    @tasks = current_user.tasks.where("deadline < ?", Time.now)
  end

  def show
    @task = @category.tasks.find(params[:id]) 
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to category_path(@category)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category), status: 303
  end
    
  private
  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :deadline)
  end
end
