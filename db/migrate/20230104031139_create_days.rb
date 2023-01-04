class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.text :event
      t.integer :price
      t.datetime :start_time
      t.string :s_time
      t.datetime :e_time
      t.references :user, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
