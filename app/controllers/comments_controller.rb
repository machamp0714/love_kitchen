class CommentsController < ApplicationController

    def create
        @article = Article.find(params[:comment][:article_id])
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to @article
        else
            :show
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:content, :article_id)
        end
end
