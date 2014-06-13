class IdeasController < ApplicationController
    
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def index
    @idea     =Idea.all
  end


  def new
    @idea = Idea.new
  end


  def show 
    @comment  = Comment.new 
    @like     = @idea.likes.where(user: current_user).first
  end

  def create
   @idea      = Idea.new(idea_attributes)
   @idea.user = current_user
   if @idea.save
    redirect_to ideas_path, notice: "You have created an idea"
   else
    flash.now[:alert]="Sorry, the question could not be created"
    render :new 
    end 
  end

  def edit
  end

  def update
    if @idea.update_attributes(idea_attributes)
      redirect_to ideas_path, notice: "The idea has been updated"
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, alert: "The idea has been successfully deleted"

  end

  private

  def idea_attributes
    params.require(:idea).permit(:title, :description)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end

end
