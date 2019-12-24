class MessageMailer < ApplicationMailer
  default to: 'smp.cof.10@gmail.com' # 送信先アドレス

  def received_email(message)
    @message = message
    mail(subject: 'webサイトよりメッセージが届きました') do |format|
      format.text
    end
  end

end