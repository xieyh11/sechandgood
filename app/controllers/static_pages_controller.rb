class StaticPagesController < ApplicationController
  def home
    @categories = Category.limit(3)
    @category = params[:category]
    if !@category
      @goods = Good.paginate(page: params[:page])
    else
      @category = Category.where("id = ?", @category).first
      if @category
        @more = false
        @categories.each do |tmp|
          @more ||= @category == tmp
        end
        @goods = @category.goods.paginate(page: params[:page])
      else
        @goods = Good.paginate(page: params[:page])
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
