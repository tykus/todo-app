class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :title, :limit => 200
    	t.string :slug, :limit => 200
    	t.text :description
    	t.date :due_date
    	t.boolean :completed
      t.timestamps
    end
  end
end
