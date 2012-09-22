class GroupMailer < ActionMailer::Base
  layout 'mailer_default'

  def weekly_review(user)
    @user = user
    @url = "http://example.com/login"
    mail(
      charset:       "utf-8",
      content_type:  "text/html",
      from:          Settings.mailer.from,
      subject:       "Group Weekly Review",
      to:            user.email
    )
  end

end
