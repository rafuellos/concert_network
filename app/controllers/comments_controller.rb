class CommentsController < ApplicationController
  def index
    @concert = Concert.find_by(id: params[:concert_id])
    @comments = @concert.comments

  end

  def new
    @concert = Concert.find_by(id: params[:concert_id])
    @comment = @concert.comments.new
  end

  def create
    @concert = Concert.find_by(id: params[:concert_id])
    @comment = @concert.comments.new comment_params

    if @comment.save
      flash[:notice] = 'The comment was created successfully'
      redirect_to concert_path(@concert.id)
    else
      @errors = @comment.errors.full_messages
      flash.now[:alert] = "The comment can't be created"
      render 'new'
    end
  end

  def edit
    @concert = Concert.find_by(id: params[:concert_id])
    @comment = @concert.comments.find params[:id]
  end

  def update
    @concert = Concert.find_by(id: params[:concert_id])
    @comment = @concert.comments.find params[:id]

    if @comment.update_attributes comment_params
      redirect_to concert_comments_path(@concert.id)
    else
      @errors = @comment.errors.full_messages
      render 'edit'
    end
    
  end

  def destroy
    @concert = Concert.find_by(id: params[:concert_id])
    @comment = @concert.comments.find params[:id]

    @comment.destroy
    redirect_to concert_path(@concert.id)
    
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :comment, :avatar)
  end
end
