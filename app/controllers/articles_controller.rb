class ArticlesController < ApplicationController
    before_action :authenticate_user!

    def new
        @article = Article.new
    end

end
