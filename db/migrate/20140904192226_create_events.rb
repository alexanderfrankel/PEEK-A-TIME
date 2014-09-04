class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title
    	t.string :location
    	t.string :start_range
    	t.string :end_range

    	t.timestamps
    end
  end
end
