require './enigma.rb'

e = Enigma.new

file_to_read = ARGV[0]
p file_to_read
unencrypted_message = File.read file_to_read
unencrypted_message = unencrypted_message.chomp
p unencrypted_message

file_to_write = ARGV[1]
p file_to_write

key = ARGV[2]
p key

date = ARGV[3]
p date

message = e.decrypt(unencrypted_message,key,date)
p message
File.write(file_to_write, message)
