class Action < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :content, presence: true

  # 同じユーザー(user_id)で、同じ日付(date)のデータは1つだけに制限する
  validates :date, uniqueness: { scope: :user_id, message: "の記録は既に存在します" }
end
