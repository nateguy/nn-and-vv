class AddVegetarianToPartyGuest < ActiveRecord::Migration
  def change
    change_table :party_guests do |t|

      t.boolean :vegetarian
    end
  end
end
