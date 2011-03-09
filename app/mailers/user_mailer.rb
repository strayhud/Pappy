class UserMailer < ActionMailer::Base
  default :from => "ryan@railscasts.com"
  
  def send_form(qform,to_field,subject_field)
    @qform = qform
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    # mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
    mail(:to => to_field, :subject => subject_field)
  end
end
