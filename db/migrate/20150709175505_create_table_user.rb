class CreateTableUser < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer "user_id"
      t.integer "listing_id"
      t.string "review"

      t.timestamps
    end
  end
end
