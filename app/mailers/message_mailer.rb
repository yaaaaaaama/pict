class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.conmail.subject
  #
  default from: "from@example.com"
  def conmail(email)
    @user = email
    mail to: @user, subject:"記事を投稿しました"
  end
end
