class RelationshipsController < ApplicationController
  before_filter :signed_in_user
  
  respond_to :html, :js

  def create
  	@user = User.find(params[:follow_id])
  	current_user.follow!(@user)
  	
  	respond_with @user
  end

  def destroy
  	@user = User.find(params[:follow_id])
  	current_user.unfollow!(@user)
  	respond_with @user
  end
end