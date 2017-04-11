class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    # no need for app/views/tasks/create.html.erb
    redirect_to article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    # no need for app/views/tasks/destroy.html.erb
    redirect_to articles_path
  end


private

  def article_params
      # *Strong params*: You need to *whitelist* what can be updated by the user
      # Never trust user data!

      params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end


end
