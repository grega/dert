class VerifyController < ApplicationController
  layout 'verify'

  def erasure_request
    unless params[:token].empty?
      erasure_request = ErasureRequest.find_by_verify_token(params[:token])
      erasure_request.verified = true
      erasure_request.verify_token = ''
      erasure_request.save
      flash.now[:success] = "Thanks for verifying your data erasure request"
    else
      flash.now[:danger] = "Error verifying erasure request"
    end
  end

end
