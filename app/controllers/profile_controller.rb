class ProfileController < ApplicationController

  def show

    @username = params[:username]

    @user = User.where(:username => @username)


  end

  def edit
    @username = params[:username]
    @user = User.where(:username => @username)
    @user ||= current_user

  end

  def update
    @username = params[:username]
    @user = User.where(:username => @username)

    @profile = Profile.where(:user_id => current_user.id)


      if @profile.update(user_params)
        redirect_to profile_path, notice: 'Votre profil a bien été mis-à-jour'
      else
        render 'edit'
      end
    end

  private

  def user_params
    params.require(:profile).permit(:name, :avatar)
  end

end
