class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :long_term_goal, :text
  end
end
