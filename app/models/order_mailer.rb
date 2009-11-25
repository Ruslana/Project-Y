class OrderMailer < ActionMailer::Base  

  def confirm(order)
    subject    'OrderMailer#confirm'
    recipients order.email
    from       ""
    sent_on    Time.now
    
    body       :order => order
  end

end
