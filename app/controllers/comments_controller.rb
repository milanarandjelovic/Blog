class CommentsController < ApplicationController

	def new
		@comment = Coment.new
	end

	# Create new comment /articles/id
	# If comment create redirect to /articles/id
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	# Delete comment /articles/id
	# If comment delete redirect to /articles/id
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	# Define strong parameters
	private
		# Define private comment parameter
		def comment_params
			params.require(:comment).permit(:author, :body)
		end

end
