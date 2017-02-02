class ApplicationMailer < ActionMailer::Base
  ADMIN_EMAIL = "booksssstore@gmail.com".freeze
  default from: ADMIN_EMAIL
  layout 'mailer'
end
