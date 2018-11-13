class RemovalActionsController < ApplicationController
  def index
    @removal_actions = RemovalAction.all
  end

  def show
    @removal_action = RemovalAction.find(params[:id])
  end

  def new
  end

  def create
    @removal_action = RemovalAction.new(removal_action_params)

    if @removal_action.save
      redirect_to @removal_action
    else
      flash.now[:danger] = "Error saving removal action, please try again"
      render :new
    end
  end

  private
    def removal_action_params
      params.require(:removal_action).permit(:notes)
    end
end
