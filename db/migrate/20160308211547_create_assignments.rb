class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :teacher_id
      t.string :name
      t.date :date_due

      t.timestamps null: false
    end
  end
end
