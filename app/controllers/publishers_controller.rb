class PublishersController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
  end

  private

  def publisher_params
    params.require(:publisher).permit(:publisher_name)
  end
end
