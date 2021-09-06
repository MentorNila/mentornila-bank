class TransfersController < ApplicationController

  def create
    @transfer = TransferCreator.new(
      params[:transferor_id],
      params[:transferee_id],
      params[:amount],
      params[:execution_date]
    ).send_funds

    if @transfer
      render json: 'Transfer was made successfully', status: :created
    else
      render json: 'Failed to transfer!', status: :unprocessable_entity
    end
  end

  private

    def transfer_params
      params.require([:transferor_id, :transferee_id, :amount, :execution_date])
    end
end
