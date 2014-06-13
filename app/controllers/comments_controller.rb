class CommentsController < ApplicationController
  before_action :find_idea

  def create
    @comment = @idea.comments.new(comment_attributes)
    if @comment.save
      redirect_to ideas_path, notice: "Your comment has been added"
    else
      redirect_to ideas_path, alert: "Your comment could not be added"
    end
  end

  def edit 

  end

  def update
      if @comment.update_attributes(comment_params)
        redirect_to ideas_path, notice: "Comment update"
      else
        flash.now[:alert] ="Fix errors and resubmit"
        render :edit    
      end
  end

    def destroy
      @comment.destroy
      redirect_to idea_path, notice: "Comment Deleted successfully"
    end

  private

  def comment_attributes
      params.require(:comment).permit(:body)
    end

    def find_idea
      @idea = Idea.find(params[:idea_id])
    end

end
