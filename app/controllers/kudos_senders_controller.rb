class KudosSendersController < ApplicationController
  before_action :authenticate_user!

  def show
    @kudos_senders = KudosRecipient.senders_list(params[:recipient_id])
  end
end
