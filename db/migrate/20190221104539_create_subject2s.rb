class CreateSubject2s < ActiveRecord::Migration[5.1]
  def change
    create_table :subject2s do |t|
      t.timestamps

      t.integer :index_id, null: false
      t.string :name, null: false
      t.string :link, null: false
      t.boolean :already, default: false, null: false
    end
  end
end
