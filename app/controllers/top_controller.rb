class TopController < ApplicationController
  before_action :authenticate_user!

  def index
    @actions = current_user.actions.where(date: @beginning_of_month..@end_of_month)

    # 1. 今日の日付を取得（2026年3月31日や、明日なら4月1日）
    @today = Date.current
    
    # 2. 今月の「1日」と「末日」を取得
    @beginning_of_month = @today.beginning_of_month
    @end_of_month = @today.end_of_month

    # 3. カレンダーの「始まりのマス」を決定（1日がある週の日曜日から表示するため）
    @start_date = @beginning_of_month.beginning_of_week(:sunday)
    # 4. カレンダーの「終わりのマス」を決定（末日がある週の土曜日まで表示するため）
    @end_date = @end_of_month.end_of_week(:sunday)
  end
end
