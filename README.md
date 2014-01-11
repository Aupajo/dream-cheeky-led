# Dream Cheeky LED Message Board

![Such art.](http://i.imgur.com/CVZJcqd.jpg)

Control the [Dream Cheeky LED Message Board](http://www.dreamcheeky.com/led-message-board) by drawing ASCII.

For scrolling text, see also:

  https://github.com/Lewis-Clayton/dcled_ruby

## Installation

**This gem is a prerelease version. The API is liable to change.**

Add this line to your application's Gemfile:

    gem 'dream-cheeky-led', '0.0.1.pre'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dream-cheeky-led --pre

## Usage

### Drawing with ASCII

```ruby
require 'dream-cheeky/led'

message_board = DreamCheeky::LEDMessageBoard.first

art = <<-ART 
  *   *
   * *
    *
   * *
  *   *
ART

message_board.draw(art)
```

The drawing will appear briefly, and disappear. This is a limitation with the device. To persist the drawing to the screen, wrap the call to `draw` in a loop:

```ruby
loop do
  message_board.draw(art)
  sleep 0.3
end
```

## Contributing

1. Fork it ( http://github.com/aupajo/dream-cheeky-led/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request