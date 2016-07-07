class PartyMailer < ActionMailer::Base
  default from: "nateguy@gmail.com"

  def confirmation_email(party)
    @party = party
    mail(to: @party.email, subject: "RSVP Confirmation to Vivian and Nate's Wedding")
  end
end
