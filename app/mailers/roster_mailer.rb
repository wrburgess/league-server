class RosterMailer < ActionMailer::Base
  layout 'mailer_default'

  def weekly_preview(user)
    @user = user
    mail(
      charset:       "utf-8",
      content_type:  "text/html",
      from:          AppSettings.mailer_from,
      subject:       "Roster Weekly Preview",
      to:            user.email
    )
  end

  class Preview < MailView
    def roster_weekly_preview
      user = User.first
      mail = RosterMailer.weekly_preview(user)
      mail
    end
  end

end