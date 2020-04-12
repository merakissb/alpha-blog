class ArticlesController < ApplicationController

    def show
        # el @ convierte la variable en una variable de instancia.
        @article = Article.find(params[:id])
    end

    def index
        @article = Article.all
    end

end
