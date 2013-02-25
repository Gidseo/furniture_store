class InterestMailer < ActionMailer::Base
  default from: "do-not-reply@balmainandbalmain.com"

  def interest_email(visitor)
    @visitor = visitor
    mail(:to => 'mail@balmainandbalmain.com', :subject => "Visitor interest notification: #{@visitor.name}")
  end
end
