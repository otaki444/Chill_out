require "rails_helper"

RSpec.describe InquiryMailer, type: :mailer do
  describe 'お問い合わせメール送信機能' do
    let(:inquiry) { create :inquiry }
    let(:mail) { InquiryMailer.inquiry_mail(inquiry) }

    it 'メールが送信されること' do
      expect do
        mail.deliver_now
      end.to change { ActionMailer::Base.deliveries.size }.by(1)
    end

    it '内容が正しいこと' do
      expect(mail.subject).to eq 'お問い合わせ通知'
    end
    it 'メールのドメインが正しいこと' do
      expect(mail.from).to eq ['from@example.com']
    end
  end
end
