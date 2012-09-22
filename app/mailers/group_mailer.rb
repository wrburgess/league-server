class GroupMailer < ActionMailer::Base
  layout 'mailer_default'

  def weekly_review(user)
    body          { user: user, url: "http://example.com/login" }
    charset       "utf-8"
    content_type  "text/html"
    from          Settings.mailer.from
    recipients    user.email
    sent_on       Time.now
    subject       "Group Weekly Review"
  end
end
