class UserInfosController < ApplicationController
  before_action :set_user_info, only: %i[show edit update destroy]

  # GET /user_infos or /user_infos.json
  def index
    @user_infos = UserInfo.all
  end

  # GET /user_infos/1 or /user_infos/1.json
  def show; end

  # GET /user_infos/new
  def new
    @user_info = UserInfo.new
  end

  # GET /user_infos/1/edit
  def edit; end

  # POST /user_infos or /user_infos.json
  def create
    @user_info = UserInfo.new(user_info_params)

    respond_to do |format|
      if @user_info.save
        format.html { redirect_to @user_info, notice: 'User info was successfully created.' }
        format.json { render :show, status: :created, location: @user_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_infos/1 or /user_infos/1.json
  def update
    respond_to do |format|
      if @user_info.update(user_info_params)
        format.html { redirect_to @user_info, notice: 'User info was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_infos/1 or /user_infos/1.json
  def destroy
    @user_info.destroy
    respond_to do |format|
      format.html { redirect_to user_infos_url, notice: 'User info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select_user
    @event = Event.find(params[:id])
    @user_infos = UserInfo.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_info
    @user_info = UserInfo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_info_params
    params.require(:user_info).permit(:first_name, :last_name, :member_status)
  end
end
