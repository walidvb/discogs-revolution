class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.integer :release_id

      t.timestamps
    end
  end
end
