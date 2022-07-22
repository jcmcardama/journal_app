class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category, only: ['show', 'edit', 'update', 'destroy']
  
  def index
    @categories = current_user.categories.all
  end

  def show
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def get_category
    @category = Category.find(params[:id])

    if @category.user_id != current_user.id
      redirect_to categories_path
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
