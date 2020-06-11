class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.date :event_date

      t.timestamps
    end
  end
end
