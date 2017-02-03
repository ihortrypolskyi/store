class ApplicationMailer < ActionMailer::Base
  ADMIN_EMAIL = "booksssstore@gmail.com".freeze
  default from: 'booksssstore@gmail.com'
  layout 'mailer'
end
