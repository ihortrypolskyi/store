class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_book

  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.id

    if @review.save
      redirect_to @book, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  def rating=param
    @rating = param.to_f
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

  def set_book
    @book = Book.find(params[:book_id])
  end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
