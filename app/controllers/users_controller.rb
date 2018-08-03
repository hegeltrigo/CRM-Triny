class UsersController < ApplicationController
  # prepend_before_action :require_no_authentication
  before_action :set_user, only: [:show, :admin_edit, :admin_update, :destroy]

  def index
    @users = User.all
    authorize @users, :index?

    respond_to do |format|
     format.html
     format.json { render json: @users.limit(2), root: false }
    end
  end

  def show

  end

  def admin_new
    @user = User.new
  end

  def admin_edit
  end

  def admin_create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :admin_new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def admin_update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to @user, notice: 'User was successfully destroyed.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

end
