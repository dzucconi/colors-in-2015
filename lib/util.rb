module Util
  class << self
    def colorize(word, color)
      "<color rgb='#{color}'>#{word}</color>"
    end

    def random_color
      '%06x' % (rand * 0xffffff)
    end

    def random_grey
      a = rand(200).to_s(16)
      [a, a, a].map { |s| s.size == 1 ? '0' + s : s }.reduce(:+)
    end
  end
end
