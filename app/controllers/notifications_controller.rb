class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  before_action :set_article
  before_action :validate_user, except: [:index, :show]

  def index
    @article = Article.find(params[:article_id])
    @notifications = @article.notifications
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
    @notification.article = Article.find(params[:article_id])
    @path = { url: article_notifications_path(@notification.article), html: { method: :post } }

  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)
    @notification.article = Article.find(params[:article_id])
    @notification.notable = @notification.article.imageable

    respond_to do |format|
      if @notification.save
        format.html { redirect_to articles_path, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
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
    def notification_params
      params.require(:notification).permit(:notification,:article)
    end
end
