class AddDetailsToRelease < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :artist, :string
    add_column :releases, :lowest_price, :integer
  end
end
