# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hannahjweinstein@gmail.com'
  layout 'mailer'
end
