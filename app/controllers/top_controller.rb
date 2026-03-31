class TopController < ApplicationController
  def index
    # ログインしているユーザーのAction（記録）をすべて取得して @actions に入れる
    @actions = current_user.actions
  end
end
