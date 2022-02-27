class UsersController < ApplicationController
  def index
    @page_ttl ="スケジュール一覧"
    @users = User.all
  end

  def new
    @page_ttl ="スケジュール新規作成"
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:id, :ttl, :start, :end, :all, :memo))
    if @user.save
      flash[:notice] = "登録しました"
      redirect_to :users
    else
      flash[:notice] = "登録できませんでした"
      render "new"
    end
  end

  def show
    @page_ttl = "スケジュール詳細"
    @user = User.find(params[:id])
  end
  
  def edit
    @page_ttl = "スケジュール編集"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:id, :ttl, :start, :end, :all, :memo))
      flash[:notice] = "更新しました"
      redirect_to :users
    else
      flash[:notice] = "更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "消去しました"
    redirect_to :users
  end
end