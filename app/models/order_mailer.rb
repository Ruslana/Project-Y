class OrderMailer < ActionMailer::Base  

  def confirm(order)
    subject    'OrderMailer#confirm'
    recipients order.email
    from       "ruslana.kiverskaya@gmail.com"
    sent_on    Time.now
    
    body       :order => order
  end

  def sent(order)
    subject    'OrderMailer#sent'
    recipients order.email
    from       "ruslana.kiverskaya@gmail.com"
    sent_on    Time.now
    
    body       :order => order
  end

end
