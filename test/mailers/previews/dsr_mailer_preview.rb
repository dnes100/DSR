# Preview all emails at http://localhost:3000/rails/mailers/dsr_mailer
class DsrMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/dsr_mailer/send_dsr
  def send_dsr
    DsrMailer.send_dsr
  end

end
