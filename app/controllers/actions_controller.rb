class ActionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @action = current_user.actions.build(action_params)

    if @action.save
      redirect_to root_path, notice: '一歩進みました！'
    else
      
      @actions = current_user.actions.order(date: :desc) 
      
      flash.now[:alert] = '保存に失敗しました。内容を確認してください。'
      render "top/index", status: :unprocessable_entity
    end
  end

  private

  
  def action_params
    params.require(:user_action).permit(:date, :content, :reflection, :tomorrow_goal)
  end
end
