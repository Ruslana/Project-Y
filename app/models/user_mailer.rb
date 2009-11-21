class UserMailer < ActionMailer::Base
  def welcome_email(order)
      recipients    order.email
      from          "My Awesome Site Notifications <notifications@example.com>"
      subject       "Welcome to My Awesome Site"
      sent_on       Time.now
      body          {:order => order, :url => "http://example.com/login"}
  end
end
