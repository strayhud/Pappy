class QformMailInterceptor
  def self.delivering_email(message)
    message.subject = "Opportunity Details: #{message.subject}"
      # message.to = "ryan@railscasts.com"
  end
end