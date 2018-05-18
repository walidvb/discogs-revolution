class AddTypeToRelease < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :type_, :string
  end
end
