class GoodsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :new]
  before_action :correct_user, only: :destroy
  before_action :auth_for_sign, only: :signforit
  def index

  end

  def new
    @good = current_user.goods.build
    @categories = Category.all.map { |tmp| [tmp.title, tmp.id] }
  end
  
  def show
    @good = Good.find(params[:id])
  end

  def create
    @good = current_user.goods.build(good_params)
    if @good.save
      flash[:success] = "Good created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @good.destroy
   redirect_to root_url 
  end

  def signforit
    tmp = Good.find(params[:id])
    sign = tmp.signs.build
    current_user.signs << sign
    sign.save!
    respond_to do |format|
      format.html { render text: tmp.user.contact }
    end
  end

  private

    def good_params
      params.require(:good).permit(:title, :content)
    end

    def auth_for_sign
      unless signed_in?
        session[:return_to]="/goods/#{params[:id]}"
        flash[:notice] = "Please sign in."
        respond_to do |format|
          format.html { render text: signin_url, status: 401 }
        end
      end
    end

    def correct_user
      @good = current_user.goods.find_by(id: params[:id])
      redirect_to root_url if @good.nil?
    end
end
