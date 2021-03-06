class ErasureRequestsController < ApplicationController
  def index
    @erasure_requests = ErasureRequest.all
  end

  def new
    @erasure_request = ErasureRequest.new
  end

  def show
    @erasure_request = ErasureRequest.find(params[:id])
  end

  def edit
    @erasure_request = ErasureRequest.find(params[:id])
  end

  def create
    @erasure_request = ErasureRequest.new(erasure_request_params)
    @erasure_request.verify_token = SecureRandom.urlsafe_base64.to_s

    if @erasure_request.save
      erasure_request_params[:property_ids].each do |property_id|
        create_removal_action(@erasure_request, property_id)
      end
      VerificationMailer.with(erasure_request: @erasure_request).verification_email.deliver_now
      redirect_to @erasure_request
    else
      flash.now[:danger] = "Error saving erasure request, please try again"
      render :new
    end
  end

  def update
    @erasure_request = ErasureRequest.find(params[:id])
   
    if @erasure_request.update(erasure_request_params)
      erasure_request_params[:property_ids].each do |property_id|
        unless @erasure_request.removal_actions.where(:property_id => property_id).exists?
          create_removal_action(@erasure_request, property_id)
        end
      end
      redirect_to @erasure_request
    else
      render 'edit'
    end
  end

  def destroy
    @erasure_request = ErasureRequest.find(params[:id])
    @erasure_request.destroy

    redirect_to erasure_requests_path
  end

  private
    def erasure_request_params
      params.require(:erasure_request).permit(:email, :verify_token, property_ids: [], removal_actions_attributes: [:id, :completed, :notes])
    end

    def create_removal_action(erasure_request, property_id)
      removal_action_params = { :erasure_request_id => erasure_request.id, :property_id => property_id }
      removal_action = erasure_request.removal_actions.create(removal_action_params)
      removal_action.save
    end
end
