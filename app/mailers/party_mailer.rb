class PartyMailer < ActionMailer::Base
  default from: "nateguy@gmail.com"

  def confirmation_email(party)
    party = party

    mail(to: party.email, subject: subject) do |format|
      format.html do
        render(
          locals: {
            party: party,
            guest_list: party.guest_list,
          }
        )
      end
    end
  end

  private

  def subject
    I18n.t('mailer.parties.subject')
  end
end
