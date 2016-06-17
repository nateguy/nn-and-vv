class PartyMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_email(party)
    puts party.email
    @party = party
    mail(to: @party.email, subject: 'test')
  end
end
