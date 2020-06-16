class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only:[:edit, :update, :destroy]
    # el @ convierte la variable en una variable de instancia.

    def show
    end

    def index
        @articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
          flash[:notice] = "Articulo creado exitosamente."
          redirect_to @article
        else 
          render 'new'
        end
    end

    def update
        if @article.update(article_params)
        flash[:notice] = "Articulo actualizado exitosamente."
        redirect_to @article
        else
          render 'edit'
        end
    end

    def destroy
        @article.destroy
        flash[:danger] = "Article was successfully deleted"
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
      if current_user != @article.user && !current_user.admin?
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to root_path
      end
    end
end
