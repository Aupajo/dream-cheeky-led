require 'spec_helper'

module DreamCheeky::LEDMessageBoard
  describe ASCIITable do
    it "reads data from an ASCII table" do
      grid = <<-GRID
          A B C D E
        1       x
        2     x   x
        3   x
      GRID

      table = ASCIITable.new(grid)

      expect(table.pixel_data).to eq([
        [0, 0, 0, 1, 0],
        [0, 0, 1, 0, 1],
        [0, 1, 0, 0, 0]
      ])
    end
  end
end