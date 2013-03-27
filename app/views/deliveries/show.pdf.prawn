red_color = "C94A48"
black_color = "190707"
pdf.stroke_color red_color
pdf.fill_color red_color

pdf.stroke do
	pdf.rounded_rectangle [30, 730], 500, 140, 30
end

pdf.image "#{Rails.root.join('app','assets','images', 'logo.png')}", at: [50, 730]

pdf.font_size(25) {pdf.draw_text 'Domi Flash', at: [220, 650]}
pdf.font_size(20) {pdf.draw_text 'Información del Domicilio', at: [180, 630]}

pdf.font_size(14) {pdf.draw_text 'Id:', at: [50, 550]}
pdf.font_size(14) {pdf.draw_text 'Nombre del Cliente:', at: [50, 530]}
pdf.font_size(14) {pdf.draw_text 'Teléfonos:', at: [50, 510]}
pdf.font_size(14) {pdf.draw_text 'Dirección:', at: [50, 490]}
pdf.font_size(14) {pdf.draw_text 'Fecha:', at: [50, 470]}

pdf.stroke do
	pdf.rounded_rectangle [30, 580], 500, 120, 20
end

pdf.move_down(80)

pdf.stroke do
	pdf.rounded_rectangle [30, 450], 500, 480, 30
end

pdf.move_down(60)

pdf.fill_color red_color

pdf.fill_color black_color

pdf.font_size(14) {pdf.draw_text @delivery.id, at:[70, 550]}
pdf.font_size(14) {pdf.draw_text @delivery.address.customer.name, at: [180, 530]}
pdf.font_size(14) {pdf.draw_text @telephones.join(' - '), at: [120, 510]}
pdf.font_size(14) {pdf.draw_text @delivery.address.value, at: [120, 490]}
pdf.font_size(14) {pdf.draw_text @delivery.created_at.strftime('%d-%m-%Y'), at: [100, 470]}

pdf.text_box @delivery.description, width: 400, height: 300, at: [60, 430], size: 14, inline_format: true