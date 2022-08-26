class RemoveZoneFromListings < ActiveRecord::Migration[7.0]
  def change
    remove_column :listings, :zone, :string
  end
end
