class PartyMailer < ActionMailer::Base
  default from: "nateguy@gmail.com"

  def confirmation_email(party)
    @party = party
    @guest_list_raw = @party&.guests&.pluck(:first_name)&.to_sentence

    mail(to: @party.email, subject: "See you at Vivian & Nate's Wedding - December 23, 2016!")
  end
end
