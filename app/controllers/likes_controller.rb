class LikesController < ApplicationController
  
  before_action :find_idea
  before_action :authenticate_user!

  def create
    @like      = @idea.likes.new
    @like.user = current_user

    if @like.save
      redirect_to ideas_path, notice: "Liked"
    else
      redirect_to ideas_path, alert: "Couldn't like"
    end
  end

  def destroy
    @like = current_user.likes.find params[:id]

    if @like.destroy
    redirect_to ideas_path, flash.now[:notice] = "Liked"
    else 
    redirect_to ideas_path, alert: "Couldnt find question"
    end 
  end

  private

  def find_idea
    @idea = Idea.find (params[:idea_id] || params[:id])
  end

end
