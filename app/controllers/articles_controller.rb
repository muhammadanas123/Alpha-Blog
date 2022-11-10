class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        # byebug
        @articles = Article.all
    end
end
