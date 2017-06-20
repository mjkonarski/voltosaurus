require 'serialport'

BAUDRATE = 9600

unless ARGV.size == 1
  puts "voltosaurus serial_port"
  return 1
end

serial_port = ARGV[0]
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(serial_port, baud_rate, data_bits, stop_bits, parity)


act = 0
loop do
  loop do
     prev = act
     act = sp.getbyte

     break if act == 255 && prev == 255
  end

  volt1 = sp.getbyte + sp.getbyte * 255
  volt2 = sp.getbyte + sp.getbyte * 255
  volt3 = sp.getbyte

  print "#{volt1} #{volt2} #{volt3}\n"
end
