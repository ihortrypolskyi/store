class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_book
  before_action :review_owner, only: [:destroy, :edit, :update]


  # GET /reviews
  def index
    @reviews = Review.where(book_id: @book.id).paginate(page: params[:page], per_page: 3).order('created_at DESC')
  end

  # GET /reviews/1
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @books = Book.all
    @carousel_first_slide = @books.order('created_at').last(4)
    @carousel_second_slide = @books.order('created_at').last(8).first(4)
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.id
    @reviews = Review.where(book_id: @book.id).paginate(page: params[:page], per_page: 3).order('created_at DESC')
    @books = Book.all
    @carousel_first_slide = @books.order('created_at').last(4)
    @carousel_second_slide = @books.order('created_at').last(8).first(4)

    respond_to do |format|
      if @review.save
        format.js
        format.html { redirect_to @book, notice: 'Thank you! Your review will appear on the site after moderation.' }
      else
        render :new
      end
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @book, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to @book, notice: 'Review was successfully destroyed.'
  end

  def approve
    Review.update_all({review_status_id: 2}, {id: params[:review_ids]})
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
      params.require(:review).permit(:rating, :comment, :review_status_id)
  end

  def review_owner
    unless current_user == @review.user
      flash[:notice] = 'You have no permission'
      redirect_to @book
    end
  end

  def set_review_status
    self.review_status_id = 1
  end

end
