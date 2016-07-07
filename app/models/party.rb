class Party < ActiveRecord::Base

  has_many :guests,
      dependent: :destroy,
      inverse_of: :party,
      class_name: Party::Guest.name,
      foreign_key: :party_id

  validates_presence_of :address, :email, :phone
  validates_format_of :email,
                      with: AppConfig.models.defaults.email.format.with_regexp,
                      allow_blank: true, if: :email_changed?
  validates_uniqueness_of :email
  validates_uniqueness_of :reference_code

  def assign_random_reference_code
    all_existing_reference_codes = Party.pluck(:reference_code).map{|c|c.to_i}
    self.reference_code = ([*1000..10000] - all_existing_reference_codes).sample
  end

  attr_accessor :last_names
  attr_accessor :first_names

  #attr_accessor :guests

  def assign_guests!
    last_names.each_with_index do |last_name, index|
      first_name = first_names[index]
      if last_name.present? && first_name.present?
        self.guests << Party::Guest.find_or_initialize_by(party: self, last_name: last_name, first_name: first_name)
      end
    end

    guests.each do |guest|
      unless last_names.include?(guest.last_name)
        guest.destroy!
      end
    end
  end
end
