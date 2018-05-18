class AddToReleasesListingsCount < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :listings_count, :integer
  end
end
