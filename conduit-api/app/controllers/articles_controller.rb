class ArticlesController < ApplicationController

  def index
    articles = Article.all
    render json: {"articles": articles.each {|article| {"title": article.title, "body": article.body}}}
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: {"article":{"title": article.title, "body": article.body}}
    end
  end


  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      render json: {"article":{"title": article.title, "body": article.body}}
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      render json: {"message": "Article deleted"}
    end
  end

  private

  def article_params
    params.require(:article).permit(:title,:body)
  end
end
