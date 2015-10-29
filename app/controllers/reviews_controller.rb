class ReviewsController < ApplicationController
  before_action :set_review, only: [:update, :destroy]
  before_action :set_article
  before_action :validate_user, except: [:index, :show]

  # POST /reviews
  # POST /reviews.json
  def create
    @review = current_user.reviews.new(review_params)
    @review.article = @article
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.article, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review.article }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review.article, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def banReview
    @review = Review.find(params[:id])
    respond_to do |format|
      @review.banned!
      format.html { redirect_to @article, notice: 'A review has just been banned' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end
    def set_article
      @article = Article.find(params[:article_id])
    end
    
    def validate_user
      unless session[:userfb_id] or session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:comment)
    end
end
