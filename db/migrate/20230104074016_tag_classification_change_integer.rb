class TagClassificationChangeInteger < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :classification, :integer
     change_column_default(:tags, :classification, 0)
  end
end
