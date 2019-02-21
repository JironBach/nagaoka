class CreateSubject1s < ActiveRecord::Migration[5.1]
  def change
    create_table :subject1s do |t|
      t.timestamps

      t.string :name, null:  :false
      t.string :link, null:  :false
    end
  end
end
