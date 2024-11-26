class ArticleController < ApplicationController
    def index
        @articles = Article.page(params[:page]).per(6)
    end


end
