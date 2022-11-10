class ArticlesController < ApplicationController


    def index
    end

    def about

    end


    def show

        @article = Article.find(params[:id])
    end
end
