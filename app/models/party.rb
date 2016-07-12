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

  attr_accessor :last_names
  attr_accessor :first_names
  attr_accessor :vegetarians

  class << self
    def vegetarian_options
      [true, false].collect{|v|[I18n.t("views.templates.party.form.vegetarian.#{v}"), v]}
    end
  end

  def guest_list
    guests&.pluck(:first_name)&.to_sentence
  end

  def assign_guests!
    guests.destroy_all
    last_names.each_with_index do |last_name, index|
      first_name = first_names[index]
      vegetarian = vegetarians[index]
      if last_name.present? && first_name.present?
        self.guests << Party::Guest.new(
                          party: self,
                          last_name: last_name,
                          first_name: first_name,
                          vegetarian: vegetarian)
      end
    end
  end

  def assign_random_reference_code
    all_existing_reference_codes = Party.pluck(:reference_code).map{|c|c.to_i}
    self.reference_code = ([*1000..10000] - all_existing_reference_codes).sample
  end


end
