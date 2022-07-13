class TasksController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id]) 
  end

  def new
    @category = Category.find(params[:category_id])
    @task = @category.tasks.build
  end

  def create
    @category = Category.find(params[:category_id])
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to category_path(@category)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category), status: 303
  end
    
  private
  def task_params
    params.require(:task).permit(:name, :description, :deadline)
  end
end
