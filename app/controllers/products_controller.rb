class ProductsController < ApplicationController
  before_action :get_product, only: [:vote, :link]

  def index
    @product = current_user.products.new if signed_in?
    @products = Product.order(created_at: :desc).group_by(&:to_date)
  end

  def create
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        @product.liked_by current_user
        format.js { @product }
      else
        format.html { redirect_to :back }
      end
    end
  end

  def vote
    unless current_user.voted_for? @product
      @product.liked_by current_user
    else
      @product.unliked_by current_user
    end

    respond_to do |format|
      format.js
    end
  end

  def link
    redirect_to @product.url
  end

  private

  def product_params
    params.require(:product).permit(:name, :tagline, :url)
  end

  def get_product
    @product = Product.find(params[:id])
  end
end
