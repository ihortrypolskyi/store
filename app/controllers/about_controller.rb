class AboutController < ApplicationController
  def index
    @carousel_first_slide = Book.order("created_at").last(4)
    @carousel_second_slide = Book.order("created_at").last(8).first(4)
    @user = User.new

  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
