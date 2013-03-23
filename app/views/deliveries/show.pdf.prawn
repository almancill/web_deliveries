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


#pdf.font("#{Rails.root.join('public', 'PinyonScript-Regular.ttf')}", size: 14, style: :normal) do
#	pdf.text "Cirugía Cabeza y Cuello - Estética y Funcional Nasal - Alergias", align: :center
#	pdf.text "Doctor: Alvaro Salas Monroy", align: :center
#	pdf.text "Universidad de Cartagena", align: :center
#	pdf.text "arsm1941@gmail.com", align: :center
#	pdf.text "Carrera 43 N0. 69E - 53 Teléfonos: 358 83 13", align: :center
#	pdf.text "Barranquilla", align: :center
#end

pdf.stroke do
	pdf.rounded_rectangle [30, 580], 500, 100, 20
end

pdf.move_down(80)

pdf.stroke do
	pdf.rounded_rectangle [30, 470], 500, 480, 30
end

pdf.move_down(60)

pdf.fill_color red_color

pdf.fill_color black_color

#pdf.text_box coder.decode(strip_tags(@story.tratamiento)), width: 400, height: 300, at: [80, pdf.y], #size: 14, inline_format: true