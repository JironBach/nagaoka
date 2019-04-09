class DeleteAlreadyFromSubject2 < ActiveRecord::Migration[5.1]
  def up
    remove_column :subject2s, :already
  end

  def down
    add_column :subject2s, :already, :boolean
  end
end
