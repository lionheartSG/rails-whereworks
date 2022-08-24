class AddZoneToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :zone, :string
  end
end
