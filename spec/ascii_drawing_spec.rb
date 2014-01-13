require 'spec_helper'

module DreamCheeky::LEDMessageBoard
  describe ASCIIDrawing do
    it "reads data from an ASCII drawing" do
      drawing = ASCIIDrawing.new <<-CROSS
x   x
 x x
  x
 x x
x   x
      CROSS

      expect(drawing.pixel_data).to eq([
        [1, 0, 0, 0, 1],
        [0, 1, 0, 1, 0],
        [0, 0, 1, 0, 0],
        [0, 1, 0, 1, 0],
        [1, 0, 0, 0, 1]
      ])
    end

    it "can ignore leading whitespace" do
      drawing = <<-DRAWING
        o
         o
        o o
      DRAWING

      drawing = ASCIIDrawing.new(drawing, ignore_leading_whitespace: true)

      expect(drawing.pixel_data).to eq([
        [1, 0, 0],
        [0, 1, 0],
        [1, 0, 1]
      ])
    end
  end
end