class ProfilesController < ApplicationController
  def new
  end
  def show
    #@profile = Profile.find(params[:id])
    render json: Profile.all
  end
end
