class AddIndexToSubject2 < ActiveRecord::Migration[5.1]
  def change
    add_reference :subject2s, :index
  end
end
