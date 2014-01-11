module DreamCheeky
  module LEDMessageBoard
    class Device
      VENDOR_ID = 0x1d34
      PRODUCT_ID = 0x0013

      def device_handle
        @device_handle ||= open_handle!
      end

      def send_bytes(bytes)
        device_handle.control_transfer(
          bmRequestType: 0x21,
          bRequest:      0x09,
          wValue:        0x0000,
          wIndex:        0x0000,
          dataOut:       bytes.pack('cccccccc')
        )
      end

      def send_packets(packets)
        packets.each do |bytes|
          send_bytes(bytes)
        end
      end

      def draw(ascii)
        pixel_data = ASCIIDrawing.new(ascii).pixel_data
        draw_pixels(pixel_data)
      end

      def draw_pixels(pixel_data)
        screen_state = ScreenState.new(pixel_data)
        send_packets(screen_state.packets)
      end

      private

      def open_handle!
        usb = LIBUSB::Context.new
        device = usb.devices(idVendor: VENDOR_ID, idProduct: PRODUCT_ID).first

        handle = device.open
        handle.detach_kernel_driver(0) if handle.kernel_driver_active?(0)
        handle
      end
    end
  end
end