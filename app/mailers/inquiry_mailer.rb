class InquiryMailer < ApplicationMailer
	def inquiry_mail(inquiry)
		@inquiry = inquiry
		mail to: ENV['EMAIL_ADDRESS'], subject: 'お問い合わせ通知'
	end
end
