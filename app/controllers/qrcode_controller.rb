require 'rqrcode'

class QrcodeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:seat_id]
      file_name = QrcodeGeneratorService.generate_qrcode(params[:seat_id])
      @qr_code_url = view_context.asset_path(file_name)      
    else
      redirect_to root_path
    end
  end
end
