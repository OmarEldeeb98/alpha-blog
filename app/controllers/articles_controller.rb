class ArticlesController < ApplicationController
   
    def index
        @articles = Article.all
        
    end
   
    def new
    @article = Article.new
   end

   def create
    @article = Article.new(article_params)

    if @article.save
        flash[:notice] = "Article was saccussafully created"
        redirect_to article_path(@article)
    else
        render 'new'
    end
   end

   def edit
    @article = Article.find(params[:id])
   end

   def show
    flash[:notice] = "article deleted successfully"
    @article = Article.find(params[:id])
   end

   def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "article deleted successfully"
    redirect_to articles_path
   end

   def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
        flash[:notice] = "Article was saccussafully updated"
        redirect_to article_path(@article)
    else
        render 'edit'
    end
   end

   private
    def article_params
        params.require(:article).permit(:title, :description)
    end

end