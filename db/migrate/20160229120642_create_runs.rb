class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.decimal :distance
      t.datetime :date
      t.integer :partners
      t.integer :time
      t.decimal :speed

      t.timestamps null: false
    end
  end
end
