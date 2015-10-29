class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:create, :new]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.search(params[:search])
  end

  def indexRegularUsers
    @categorias = Category.all
    @articles = Article.approved.search_by_category(params[:category_id]).search(params[:search])
  end

  def myArticles
    @user = current_user
    @articles = @user.articles
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @review = Review.new
  end

  # GET /articles/new
  def new
    @article = Article.new
    @category = Category.all
  end

  # GET /articles/1/edit
  def edit
    @category = Category.all
    @article.pending!
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @article = Article.find(params[:id])
    if current_user.flagged?(@article)
      current_user.unflag(@article)
      @article.likes -= 1
      @article.save
    else
      current_user.flag(@article)
      @article.likes += 1
      @article.save
    end
    
    redirect_to article_path(@article)

    #@article.likes += 1
    
    #@article.save

    #redirect_to article_path(@article)
    
  end

  def approveArticle
    @article = Article.find(params[:id])
    respond_to do |format|
      @article.approved!
      format.html { redirect_to @article, notice: 'Article Approved' }
    end
  end

  def rejectArticle
    @article = Article.find(params[:id])
    respond_to do |format|
      @article.rejected!
      format.html { redirect_to new_article_notification_path(@article), notice: 'Article Rejected' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end
    def validate_user
      unless session[:userfb_id] or session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :price, :likes, :description, :state, :image, :category_id)
    end
end
