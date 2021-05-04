class BoardsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to boards_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def show
    @comment = Comment.new
    @board = Board.find(params[:id])
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path, success: '掲示板を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy!
    redirect_to boards_path, success: '掲示板を削除しました'
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end

  def ensure_user
    @board = current_user.boards.find(params[:id])
  end
end
