module DreamCheeky
  module LEDMessageBoard
    class ScreenState
      BRIGHTNESS = {
        max: 0,
        mid: 1,
        min: 2
      }

      WIDTH = 21
      HEIGHT = 7

      NUM_PACKETS = (HEIGHT.to_f / 2).ceil
      ROWS_PER_PACKET = 2
      
      def initialize(rows, brightness: :max)
        @rows = rows
        @brightness = brightness
      end

      def packets
        Array.new(NUM_PACKETS) do |i|
          packet(i * ROWS_PER_PACKET)
        end
      end

      def packet(row_start)
        [
          brightness,
          row_start,
          rows_data(row_start)
        ].flatten.compact
      end

      private

      def rows_data(row_start)
        Array.new(ROWS_PER_PACKET) do |i|
          row_data(row_start + i)
        end
      end

      def row_data(row_index)
        row = @rows[row_index] || Array.new(8, 0)

        row.fill(0, row.length...WIDTH)

        row.each_slice(8).map do |states|
          byte_data(states)
        end.reverse
      end

      def byte_data(states)
        byte = 0

        0.upto(7) do |i|
          state = states[i] || 0
          byte |= state << i
        end

        0xFF - byte
      end

      def brightness
        BRIGHTNESS[@brightness]
      end

    end
  end
end