class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :goods do |t|
      t.text :plan_id
      t.text :user_id

      t.timestamps
    end
  end
end
