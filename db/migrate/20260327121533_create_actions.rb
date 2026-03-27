class CreateActions < ActiveRecord::Migration[7.1]
  def change
    create_table :actions do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :content
      t.text :reflection
      t.string :tomorrow_goal

      t.timestamps
    end
  end
end
