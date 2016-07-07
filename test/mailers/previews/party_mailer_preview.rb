# Preview all emails at http://localhost:3000/rails/mailers/party_mailer
class PartyMailerPreview < ActionMailer::Preview
  def confirmation_email
    PartyMailer.confirmation_email(Party.first)
  end
end
