class DsrMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.dsr_mailer.send_dsr.subject
  #
  def send_dsr
    @tasks = {}
    Employee.all.each do |employee|
      @tasks[employee] =  Task.where(employee_id: employee.employee_id, date: "2014-11-22")
    end
    
    mail to: "dnes.elves@gmail.com", subject: "test mail"
  end
end
