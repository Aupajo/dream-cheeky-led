module DreamCheeky
  module LEDMessageBoard
    class ASCIITable < ASCIIDrawing

      def initialize(string, ignore_leading_whitespace: false)
        super string, ignore_leading_whitespace: true
      end

      protected

      def lines
        lines_without_leading_whitespace[1..-1].map do |line|
          line[2..-1].each_char.each_slice(2).map(&:first).join
        end
      end
    end
  end
end