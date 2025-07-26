class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|

      t.integer :user_id
      t.date :starting_date
      t.date :ending_date
      t.string :place
      t.string :title
      t.text :detail

      t.timestamps
    end
  end
end
