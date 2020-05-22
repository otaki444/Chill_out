class HomesController < ApplicationController
  def home
  	@inquiry = Inquiry.new
  end

  def about
  end
end
