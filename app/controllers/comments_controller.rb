class CommentsController < ApplicationController
	before_action :set_product
	before_action :set_comment, :only=>[:edit, :update, :destroy]

	def create
		@comment = @product.comments.new(comment_params)
		@comment.user = current_user

		refresh
	end

	def edit
		@message = ""
		refresh

	end

	def update
		if @comment.update(comment_params)
			@message = "Successful to update"
		else
			@message = "Not updated"
		end

		@comment = @product.comments.new
		refresh
	end

	def destroy
		@comment.destroy

		@comment = @product.comments.new

		refresh
	end

private
	def comment_params
		params.require(:comment).permit(:name)
	end

	def set_product
		@product = Product.find params[:product_id]
		@comments = @product.comments.order('id desc')
	end

	def set_comment
		@comment = @product.comments.find params[:id]
	end

	def refresh
		respond_to do |format|
			format.js {render 'comments/refresh'}
		end
	end

end
