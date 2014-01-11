require 'spec_helper'

module DreamCheeky::LEDMessageBoard

  describe Pattern do
    describe "#to_a" do
      it "returns an array of rows" do
        pattern = Pattern.new([
          [0, 0, 0, 1],
          [0, 0, 1, 0],
          [0, 1, 0, 0],
          [1, 0, 0, 0]
        ])

        expect(pattern.to_a).to eq([
          [0, 0, 0, 1],
          [0, 0, 1, 0],
          [0, 1, 0, 0],
          [1, 0, 0, 0]
        ])
      end
    end

    describe ".from_ascii" do
      it "reads data from an ASCII drawing" do
        pattern = Pattern.from_ascii <<-CROSS
x   x
 x x
  x
 x x
x   x
        CROSS

        expect(pattern.to_a).to eq([
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

        pattern = Pattern.from_ascii(drawing, ignore_leading_whitespace: true)

        expect(pattern.to_a).to eq([
          [1, 0, 0],
          [0, 1, 0],
          [1, 0, 1]
        ])
      end
    end

    describe ".from_ascii_table" do
      it "reads data from an ASCII table" do
        grid = <<-GRID
            A B C D E
          1       x
          2     x   x
          3   x
        GRID

        pattern = Pattern.from_ascii_table(grid)

        expect(pattern.to_a).to eq([
          [0, 0, 0, 1, 0],
          [0, 0, 1, 0, 1],
          [0, 1, 0, 0, 0]
        ])
      end
    end

    it "translates a pattern into bytes" do
      table = <<-TABLE
          A B C D E F G H I J K L M N O P Q R S T U
        1                 x
        2               x   x
        3             x       x
        4           x           x
        5             x       x
        6               x   x
        7                 x
      TABLE


      pattern = Pattern.from_ascii_table(table)
      screen = ScreenState.new(pattern.to_a)

      expect(screen.packets).to eql([
        [0x00, 0x00,  0xFF, 0xFE, 0xFF,  0xFF, 0xFD, 0x7F],
        [0x00, 0x02,  0xFF, 0xFB, 0xBF,  0xFF, 0xF7, 0xDF],
        [0x00, 0x04,  0xFF, 0xFB, 0xBF,  0xFF, 0xFD, 0x7F],
        [0x00, 0x06,  0xFF, 0xFE, 0xFF,  0xFF, 0xFF, 0xFF]
      ])
    end
  end

end