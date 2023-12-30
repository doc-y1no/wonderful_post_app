class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :user_login_required, only: %i[new create edit update destroy]
  before_action :set_article, only: %i[ new create edit update destroy ]


  def index
    @articles = Article.all
  end

  def user
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
  end


  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "#{t('activerecord.models.article')}を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

def update
  if @article.update(article_params)
    redirect_to @article, notice: "#{t('activerecord.models.article')}を編集しました。"
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @article.destroy
    redirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
end

private
def set_article
  @article = current_user.articles.find(params[:id])
end

def article_params
  params.require(:article).permit(:title, :content)
end
end
