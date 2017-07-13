class NewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update]

  def index
    @news = News.order('id desc')
  end

  def show
    @new = News.find(params[:id])

    @comments = Comment.where(["new_id = :u", { u: @new.id }])

    @new_comment = Comment.new
  end

  def new
    @new = News.new
  end

  def create
    @new = News.new(new_params)

    if @new.save
      redirect_to news_path(@new.id), notice: 'Votre article a bien été creer'
    else
      render 'new'
    end
  end

  def edit
    @new = News.find(params[:id])
  end

  def update
    @new = News.find(params[:id])

    if @new.update_attributes(new_params)
      # Handle a successful update.
      redirect_to news_path(@new.id), notice: 'Votre article a bien été modifier'
    else
      render 'edit'
    end
  end

  private

  def new_params
    params.require(:news).permit(:title, :summary, :content)
  end
end
