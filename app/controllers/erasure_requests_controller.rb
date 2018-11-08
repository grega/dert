class ErasureRequestsController < ApplicationController
  def index
    @erasure_requests = ErasureRequest.all
  end

  def show
    @erasure_request = ErasureRequest.find(params[:id])
  end

	def new
    @erasure_request = ErasureRequest.new
  end

  def create
    @erasure_request = ErasureRequest.new(erasure_request_params)
    @erasure_request.verify_token = SecureRandom.urlsafe_base64.to_s

    if @erasure_request.save
      VerificationMailer.with(erasure_request: @erasure_request).verification_email.deliver_now
      redirect_to @erasure_request
    else
      flash.now[:danger] = "Email already exists, please try again"
      render :new
    end
  end

  def verify
    erasure_request = ErasureRequest.find_by_verify_token(params[:token])
    erasure_request.verified = true
    erasure_request.save
  end

  private
    def erasure_request_params
      params.require(:erasure_request).permit(:email, :verify_token, property_ids: [])
    end
end
