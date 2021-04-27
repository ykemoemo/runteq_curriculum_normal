class BoardsController < ApplicationController
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

  private

  def board_params
<<<<<<< HEAD
    params.require(:board).permit(:title, :body, :board_image)
=======
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
>>>>>>> [Add] board image upload function
  end
end
