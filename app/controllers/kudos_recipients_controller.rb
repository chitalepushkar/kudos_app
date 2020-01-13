class KudosRecipientsController < ApplicationController
  def create
    @kudos_recipient = KudosRecipient.new(create_params)

    respond_to do |format|
      format.json do
        if @kudos_recipient.valid?
          @kudos_recipient.save
          render json: @kudos_recipient and return
        end
        render json: {error: @kudos_recipient.errors.messages}, status: 400
      end
    end
  end

  private

  def create_params
    params.require(:kudos_recipient).permit(:sender_id, :recipient_id, :message)
  end
end
