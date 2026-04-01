class TopController < ApplicationController
  before_action :authenticate_user!

  def index
  # URLに year と month があればそれを使い、なければ今の年月を使う
  @display_date = if params[:year] && params[:month]
                    Date.new(params[:year].to_i, params[:month].to_i, 1)
                  else
                    Date.current
                  end

  # 表示月の「1日」と「末日」
  @beginning_of_month = @display_date.beginning_of_month
  @end_of_month = @display_date.end_of_month

  # 表示月のデータだけを取得
  @actions = current_user.actions.where(date: @beginning_of_month..@end_of_month)

  # カレンダーの枠組み用
  @start_date = @beginning_of_month.beginning_of_week(:sunday)
  @end_date = @end_of_month.end_of_week(:sunday)
  
  # 「今日」の判定用（カレンダーの枠を光らせるため）
  @today = Date.current
  end
end
