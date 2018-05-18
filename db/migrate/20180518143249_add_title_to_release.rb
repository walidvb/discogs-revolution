class AddTitleToRelease < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :title, :string
  end
end
