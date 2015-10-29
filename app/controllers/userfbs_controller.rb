class UserfbsController < ApplicationController
	before_action :set_userfb
  def show
  end


  def destroy
  	@user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def defineAdminRole
    @userfb = Userfb.find(params[:id])
    respond_to do |format|
    
    if @userfb.admin?# si el usuario es Admin
      @userfb.regularUser!
      format.html { redirect_to @userfb, notice: 'Admin role removed' }
    else
      @userfb.admin!
      format.html { redirect_to @userfb, notice: 'Admin role adquired' }
    end
  	end 
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_userfb
      @user = Userfb.find(params[:id])
    end

end
