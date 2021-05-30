class Admin::UsersController < Admin::BaseController
    before_action :set_user, only: %i[show edit update destroy]
    def index
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    end
  
    def edit; end
  
    def show; end
  
    def update
      if @user.update(user_update_params)
        redirect_to admin_user_path(@user), success: 'ユーザーを更新しました'
      else
        flash.now[:danger] = '編集に失敗しました'
        render :edit
      end
    end
  
    def destroy
      @user.destroy
      redirect_to admin_users_path, success: 'ユーザーを削除しました'
    end
  
    private

    def set_user
      @user = User.find(params[:id])
    end
  
    def user_update_params
      params.require(:user).permit(:email, :last_name, :first_name, :avatar, :role)
    end
end
