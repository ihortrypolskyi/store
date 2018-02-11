module ApplicationHelper
  # def carousel
  #   @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 4).order('in_stock DESC, title').includes(:reviews)
  #   @carousel_first_slide = Book.order("created_at").last(6)
  #   @carousel_second_slide = Book.order("created_at").last(12).first(6)
  # end
end
