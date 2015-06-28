require 'prawn'
require 'prawn/measurement_extensions'
require_relative './lib/util'

Prawn::Document.generate("./output/meta_#{Time.now.to_i}.pdf", {
  page_size: [4.25.in, 6.88.in],
  margin: [0.5.in, 0.5.in, 1.in, 0.5.in]
}) do |pdf|
  styling = {
    inline_format: true,
    leading: 2,
    kerning: true,
    size: 9
  }

  pdf.font './fonts/union.ttf'

  pdf.text [
    'colors in 2015',
    'damon zucconi'
  ].join("\n"), styling

  pdf.start_new_page

  words = File.open('./dictionaries/meta.txt').read.split("\n").shuffle
  output = words.map { |word|
    Util.colorize(word.gsub(' ', ''), Util.random_grey)
  }.join ' '

  pdf.text output, styling

  pdf.number_pages '<page>', {
    at: [0, -18],
    align: :center,
    start_count_at: 1,
    color: '000000',
    size: 9
  }
end
