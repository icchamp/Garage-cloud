class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  
  def create
  @product = Product.new(product_params)
  @product.user_id = current_user.id
    if @product.save
      redirect_to product_path(@product), notice: "レシピを投稿しました。"
    else
      render :new
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end
  
  private
  def product_params
    params.require(:product).permit(:title, :body, :image)
  end
end