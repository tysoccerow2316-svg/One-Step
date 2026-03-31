class ActionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @action = current_user.actions.build(action_params)

    if @action.save
      redirect_to root_path, notice: '一歩進みました！'
    else
      render "top/index", status: :unprocessable_entity
    end
  end

  private

  
  def action_params
    params.require(:user_action).permit(:date, :content, :reflection, :tomorrow_goal)
  end
end
