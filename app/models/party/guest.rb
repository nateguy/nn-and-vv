class Party::Guest < ActiveRecord::Base

  def self.table_name_prefix
    'party_'
  end

  belongs_to :party,
      touch: false,
      inverse_of: :guests,
      class_name: Party.name,
      foreign_key: :party_id

end
