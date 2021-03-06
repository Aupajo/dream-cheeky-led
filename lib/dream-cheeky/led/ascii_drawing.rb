module DreamCheeky
  module LEDMessageBoard
    class ASCIIDrawing
      EMPTY_VALUES = [nil, " "]
      OFF_STATE = 0
      ON_STATE = 1

      attr_reader :lines

      def initialize(string, ignore_leading_whitespace: false)
        @lines = string.split("\n")
        @ignore_leading_whitespace = ignore_leading_whitespace
      end

      def pixel_data
        rows
      end

      protected

      def lines
        if ignore_leading_whitespace?
          lines_without_leading_whitespace  
        else
          @lines
        end
      end

      private

      def max_row_length
        lines.max_by(&:length).length
      end

      def ignore_leading_whitespace?
        @ignore_leading_whitespace
      end

      def rows
        lines.map do |line|
          Array.new(max_row_length).map.with_index do |state, index|
            character_state(line[index])
          end
        end
      end

      def lines_without_leading_whitespace
        @lines.map do |line|
          line[position_of_earliest_char..-1]
        end
      end

      def position_of_earliest_char
        @lines.map do |line|
          line.index(/[^\s+]/) || 0
        end.min
      end

      def is_empty?(char)
        EMPTY_VALUES.include?(char)
      end

      def character_state(char)
        is_empty?(char) ? OFF_STATE : ON_STATE
      end
    end
  end
end