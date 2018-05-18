class AddDefaultListingsCount < ActiveRecord::Migration[5.2]
  def change
    change_column :releases, :listings_count, :integer, default: 0
  end
end
