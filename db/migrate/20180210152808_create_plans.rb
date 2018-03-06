class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.integer :user_id,null: false
      t.text  :title
      t.text  :overview
      t.text  :detail
      t.integer :good,default: 0
      t.integer :comment,default: 0
      

      t.timestamps
    end
  end
end
