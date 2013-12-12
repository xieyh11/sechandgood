class CategoriesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  def index
    @categories = Category.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path
  end

  private

    def category_params
      params[:category].permit(:title)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
