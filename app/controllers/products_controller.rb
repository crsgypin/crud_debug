class ProductsController < ApplicationController
  before_action :set_product, only: [:create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only=>[:create,:update,:destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:edit_id]
      @product = Product.find params[:edit_id]
    else
      @product = Product.new
    end
    @products = Product.all.order('id desc')
  end

  def show
    @comment = Comment.new
    @comments = @product.comments.order('id desc')
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product.user = current_user
    if @product.update(product_params)
      redirect_to products_path
    else
      render prodcuts_path
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.new
    @product.user = current_user
    if @product.update(product_params)
      redirect_to products_path
    else
      render prodcuts_path
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :desc, :price, :category_id)
    end
end
