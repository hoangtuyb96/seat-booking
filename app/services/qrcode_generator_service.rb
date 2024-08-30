class QrcodeGeneratorService
  def self.generate_qrcode(seat_number)
    url = "http://#{Rails.configuration.domain}/checkins/new?seat_id=#{seat_number}"
    qrcode = RQRCode::QRCode.new(url)

    # Generate QR code image
    qr_code_image = qrcode.as_png(size: 300)

    # Save QR code image to assets
    qr_code_filename = "qrcode_#{seat_number}.png"
    qr_code_path = Rails.root.join('app', 'assets', 'images', qr_code_filename)
    qr_code_image.save(qr_code_path)

    # Render QR code image in index.html.erb
    qr_code_filename
  end
end
