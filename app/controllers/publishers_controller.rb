class PublishersController < ApplicationController
  private

  def publisher_params
    params.require(:publisher).permit(:publisher_name)
  end
end
