# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]
    before_action :configure_permitted_parameters
    # GET /resource/sign_up
    def new
      super(&:build_user_info)
    end

    # POST /resource
    # def create
    #   super do |resourse|
    #     @user.user_info = new(params[:user_info])
    #     resource.save
    #   end
    # end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    def update
      # configure_account_update_params
      # if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      #   params[:user].delete(:password)
      #   params[:user].delete(:password_confirmation)
      # end
      # @user = User.find(params[:id])

      # if update_resource(resource, account_update_params)
      #   puts 'the user info successfully updated' #add whatever you want
      # else
      #   puts 'failed'
      # end
      # redirect_to admins_path
      super
    end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    def update_role
      configure_account_update_params
      @user = User.find(params[:id])
      # @user.role = params[:role]
      # @user.password = nil
      # @user.password_confirmation = nil
      # @user.save!
      if @user.update(params.except(:id))
        puts 'the user info successfully updated' #add whatever you want
      else
        puts 'failed'
      end
      redirect_to admins_path
    end

    protected

    def update_resource(resource, params)
      if current_user.master?
        resource.update_without_password(params.except("current_password"))
      else
        resource.update_with_password(params)
      end
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
                                        keys: [:email, :password, :password_confirmation, :role,
                                               { user_info_attributes: %i[first_name last_name member_status] }])
      devise_parameter_sanitizer.permit(:account_update,
                                        keys: [:email, :password, :password_confirmation, :role,
                                               { user_info_attributes: %i[first_name last_name member_status] }])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
