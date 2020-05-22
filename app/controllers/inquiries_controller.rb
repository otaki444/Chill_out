class InquiriesController < ApplicationController
  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
     	InquiryMailer.inquiry_mail(@inquiry).deliver
      	flash[:notice] = 'お問い合わせを受け付けました'
      	redirect_to root_path
    else
    	flash.now[:alert] = '送信に失敗しました'
      	render template: "homes/home"
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
