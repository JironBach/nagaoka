class CreateAlreadies < ActiveRecord::Migration[5.1]
  def change
    create_table :alreadies do |t|
      t.timestamps

      t.references :subject2, index: true, null: false
      t.references :user, index: true, null: false
      t.boolean :already, default: false, null: false
    end
  end
end
