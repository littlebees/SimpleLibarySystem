class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.belongs_to :user, index: true, null:false
      t.belongs_to :copy, index: true, null:false
      t.date :lent_out_date
      t.date :due_date
      t.date :back_date

      t.timestamps null: false
    end
    add_foreign_key :receipts, :users
    add_foreign_key :receipts, :copies
  end
end
