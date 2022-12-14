class CategoriesController < ApplicationController

    before_action :require_admin, except: [:index, :show]


    def new
        @category = Category.new
    end

    def index

        @categories = Category.paginate(page: params[:page], per_page: 5)
    end

    def show
        @category = Category.find(params[:id])
        @articles = @category.articles.paginate(page: params[:page], per_page: 5)


    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Category is successfully created."
            redirect_to category_path(@category)
        else
            render "new"
        end

    end



    private

    def category_params
        params.require(:category).permit(:name)

    end

    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Only admin can perform that action"
            redirect_to categories_path
        end

    
    end


end