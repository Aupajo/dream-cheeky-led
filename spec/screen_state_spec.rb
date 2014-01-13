require 'spec_helper'

module DreamCheeky::LEDMessageBoard
  describe ScreenState do
    it "translates a pattern into bytes" do
      table = ASCIITable.new <<-GRID
          A B C D E F G H I J K L M N O P Q R S T U
        1                 x
        2               x   x
        3             x       x
        4           x           x
        5             x       x
        6               x   x
        7                 x
      GRID

      screen = ScreenState.new(table.pixel_data)

      expect(screen.packets).to eql([
        [0x00, 0x00,  0xFF, 0xFE, 0xFF,  0xFF, 0xFD, 0x7F],
        [0x00, 0x02,  0xFF, 0xFB, 0xBF,  0xFF, 0xF7, 0xDF],
        [0x00, 0x04,  0xFF, 0xFB, 0xBF,  0xFF, 0xFD, 0x7F],
        [0x00, 0x06,  0xFF, 0xFE, 0xFF,  0xFF, 0xFF, 0xFF]
      ])
    end
  end
end