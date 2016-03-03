	class CommentsController < ApplicationController
	before_action :authenticate_user!

	http_basic_authenticate_with name: "push", password: "push", only: :destroy

	def index
		@comments = Comment.where(:article_id => params[:article_id])
	end
	def create
		 @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
     redirect_to article_path(@article)
	end

	def destroy
		 @article = Article.find(params[:article_id])
		 @comment = @article.comments.find(params[:id])
		 @comment.destroy
		 redirect_to article_path(@article)
	end

	private
	 def comment_params
	 	  params.require(:comment).permit(:body,:commenter)
	 end
end
