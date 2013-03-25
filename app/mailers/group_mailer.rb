class GroupMailer < ActionMailer::Base
  layout 'mailer_default'

  def weekly_review(user)
    @user = user
    @url = "http://example.com/login"
    mail(
      charset:       "utf-8",
      content_type:  "text/html",
      from:          AppSettings.mailer_from,
      subject:       "Group Weekly Review",
      to:            user.email
    )
  end

  class Preview < MailView
    def group_weekly_review
      user = User.first
      mail = GroupMailer.weekly_review(user)
      mail
    end
  end

end
