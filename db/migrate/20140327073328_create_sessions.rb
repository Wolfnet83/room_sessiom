class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :room_id
      t.datetime :begin_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
