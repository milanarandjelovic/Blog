class ArticlesController < ApplicationController
	
	# Show all articles /articles
	def index
		@articles = Article.all
	end

	# Show article /article/id
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	# If article not create render this action
	def new
		@article = Article.new
	end

	# Id article not edit render this action
	def edit
		@article = Article.find(params[:id])
	end

	# Create new article /articles/new
	# If article create redirect to /article/id
	# else render 'new' action
	def create
		@article = Article.new(article_params) 
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	# Update article /articles/id/edit
	# If article edit redirect to /articles/id
	# else render 'edit' action
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	# Delete article and redirect to /articles
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	# Define strong parameters
	private
		# Define private article parameter
		def article_params
			params.require(:article).permit(:title, :body)
		end

end
