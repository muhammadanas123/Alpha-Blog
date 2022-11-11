class ArticlesController < ApplicationController


    def home 

        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end

    def index
        # byebug
        @articles = Article.all
    end


    def new 
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])

    end
    

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
    
        if @article.save
            flash[:notice] = "Article was created successfully"
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end


    def update

        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Articles was update successfully"
            redirect_to @article
        else
            render "edit"
        end

    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to article_path
    end
end
