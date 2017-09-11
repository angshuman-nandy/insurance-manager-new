class UserMailer < ApplicationMailer
  default from: 'InsuranceManager@noreply.com'

   def policy_email(user,policy)
    @user = user
    @policy = policy
    @plan = Plan.find(@policy.plan_id)
    @company = Company.find(@plan.company_id)
    mail(to: @user.email, subject: 'New Policy Created')
  end
end
