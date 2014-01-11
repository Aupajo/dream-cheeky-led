module DreamCheeky
  module LEDMessageBoard
    class Pattern
      OFF_STATE = 0
      ON_STATE = 1

      def initialize(rows)
        @rows = rows
      end

      def to_a
        @rows
      end

      def self.from_ascii(*args)
        ASCIIDrawing.new(*args).to_pattern
      end

      def self.from_ascii_table(*args)
        ASCIITable.new(*args).to_pattern
      end
    end
  end
end