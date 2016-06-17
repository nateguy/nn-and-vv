class CreatePartyGuests < ActiveRecord::Migration
  def change
    create_table :party_guests do |t|

      t.timestamps
    end
  end
end
