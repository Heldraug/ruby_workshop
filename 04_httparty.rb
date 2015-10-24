require 'json'
require 'awesome_print'
require 'httparty'

class Client
  include HTTParty

  HOST_IP = '127.0.0.1'
  PORT    = '3000'

  # Creates a new phrase
  def new_phrase(content)
    phrase = { content: content }
    self.class.post(url('api/phrases.json'), body: phrase)
  end

  # Views a phrase
  def view_phrase(id)
    self.class.get(url("api/phrases/#{id}.json"))
  end

  # Edits a phrase
  def edit_phrase(id, content)
    stub_response # REPLACE ME!
  end

  # Deletes a phrase
  def delete_phrase(id)
    stub_response # REPLACE ME!
  end

  # Views ten random phrases
  def view_ten_phrases
    stub_response # REPLACE ME!
  end

  # Views a random phrase
  def random_phrase
    stub_response # REPLACE ME!
  end

  private
  def url(route = '')
    "http://#{HOST_IP}:#{PORT}/#{route}"
  end

  def stub_response
    {'id' => 1, 'message' => 'WORK IN PROGRESS'}
  end
end

# Printing Everything!
c = Client.new

puts "Creating a new Phrase!"
response = c.new_phrase('This is Sparta!!')
ap response
puts

puts "Viewing said phrase!"
response = c.view_phrase(response['id'])
ap response
puts

puts "Editing my phrase!"
response = c.edit_phrase(response['id'], 'FEEL FREE TO CHANGE ME')
ap response
puts

puts "Deleting my phrase :("
response = c.delete_phrase(response['id'])
ap response
puts

puts '-----'
puts 'EXTRA'
puts '-----'
puts

puts "Viewing 10 phrases"
response = c.view_ten_phrases
ap response
puts

puts "View random phrase"
response = c.random_phrase
ap response
puts
