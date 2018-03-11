class AboutController < ApplicationController
  before_action :carousel

  def index
    @user = User.new
  end

  def privacy
    @user = User.new
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
