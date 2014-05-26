class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.date :due_date
      t.boolean :completed, :default => false

      t.timestamps
    end
  end
end
