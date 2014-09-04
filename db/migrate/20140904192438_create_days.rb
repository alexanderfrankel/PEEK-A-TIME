class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
    	t.string :start_day
    	t.string :end_day
    	t.integer :score, default: 0
    	t.references :event

    	t.timestamps
    end
  end
end
