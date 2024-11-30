class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules do |t|
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
