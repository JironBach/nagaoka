class CreateLectureItems < ActiveRecord::Migration[5.1]
  def change
    create_table :lecture_items do |t|
      t.timestamps

      t.integer :subject2_id, null: false
      t.string :name, null: false
      t.string :image, null: false
      t.string :link, null: false
     end
  end
end
