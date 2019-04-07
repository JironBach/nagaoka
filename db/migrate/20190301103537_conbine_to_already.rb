class ConbineToAlready < ActiveRecord::Migration[5.1]
  def up
    add_column :alreadies, :index_id, :integer, null: false
    add_column :alreadies, :name, :string, null: false
    add_column :alreadies, :image, :string, null: false
    add_column :alreadies, :link, :string, null: false
  end

  def down
    remove_columns :alreadies, :index_id, :name, :link
  end

end
