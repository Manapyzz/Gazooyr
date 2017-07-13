class GazooiesController < ApplicationController
  def index
    @posts = Gazooy.order('created_at DESC')
  end

  def create
    if current_user.gazooys.create(gazooy_params)
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  private

  def gazooy_params
    params.require(:gazooy).permit(:text)
  end


end
