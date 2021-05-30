class Admin::BoardsController < Admin::BaseController
    before_action :set_board, only: %i[edit show update destroy]
    def index
      @q = Board.ransack(params[:q])
      @boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
    end
  
    def edit; end
  
    def show
      @board = Board.find(params[:id])
      @comment = Comment.new
      @comments = @board.comments.includes(:user).order(created_at: :desc)
    end
  
    def update
      if @board.update(board_update_params)
        redirect_to admin_board_path(@board), success: '掲示板を更新しました'
      else
        flash.now['danger'] = '掲示板を更新できませんでした'
        render :edit
      end
    end
  
    def destroy
      @board.destroy
      redirect_to admin_boards_path, success: '掲示板を削除しました'
    end
  
    private
  
    def board_update_params
      params.require(:board).permit(:title, :body, :user_id, :board_image, :board_image_cache)
    end
  
    def set_board
      @board = Board.find(params[:id])
    end
  end
