class TagClassificationStringChangeInteger < ActiveRecord::Migration[7.0]
  def change
    add_column :days, :calender_day, :string
  end
end
