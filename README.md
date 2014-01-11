# Dream Cheeky LED Message Board

[![Very build status](https://travis-ci.org/Aupajo/dream-cheeky-led.png?branch=master)](https://travis-ci.org/Aupajo/dream-cheeky-led)
[![So Code Climate](https://codeclimate.com/github/Aupajo/dream-cheeky-led.png)](https://codeclimate.com/github/Aupajo/dream-cheeky-led)

![Such art](http://i.imgur.com/CVZJcqd.jpg)

Control the [Dream Cheeky LED Message Board](http://www.dreamcheeky.com/led-message-board) by drawing ASCII.

For scrolling text, see also:

  https://github.com/Lewis-Clayton/dcled_ruby

## Installation

**This gem is a prerelease version. The API is liable to change.**

Add this line to your application's Gemfile:

    gem 'dream-cheeky-led', '0.0.1.pre2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dream-cheeky-led --pre

## Usage

### Drawing with ASCII

The message board contains 21 x 7 pixels. Any drawing that fits within those dimensions will work.

```ruby
require 'dream-cheeky/led'

message_board = DreamCheeky::LEDMessageBoard.first

art = <<-ART 
  *****     ***  ***
 *  ****    *  * *  *
*   *****   *  * *  *
 *  ****    * *  ***
  * ***     ***  *  *
   ***      * *  *  *
    *     * *  * ***
ART

message_board.draw(art)
```

You can use any character that isn't a space to represent a pixel (e.g. `*`, `x`, `o`).

The drawing will appear briefly, and disappear. This is a limitation with the device. To persist the drawing to the screen, wrap the call to `draw` in a loop:

```ruby
loop do
  message_board.draw(art)
  sleep 0.3
end
```

### Drawing from pixel data

```ruby
pixel_data = [
  [1, 0, 0, 0, 1],
  [0, 1, 0, 1, 0],
  [0, 0, 1, 0, 0],
  [0, 1, 0, 1, 0],
  [1, 0, 0, 0, 1]
]

message_board.draw_pixels(pixel_data)
```

## Contributing

1. Fork it ( http://github.com/aupajo/dream-cheeky-led/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
