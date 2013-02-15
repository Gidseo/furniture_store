class InterestNotice < ActionMailer::Base

  def notify_us(name, email, telephone, postcode, heard_from, message)
     content_type 'text/html'
     recipients 'mail@balmainandbalmain.com'
     # recipients 'benemson@fastmail.fm'
     subject "User registration notification: #{name}"
     from email
     body( :name => name, :email => email, :telephone => telephone,
           :postcode => postcode, :heard_from => heard_from, :message => message
         )
   end

end
