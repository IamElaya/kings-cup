class Game < ActiveRecord::Base

  has_many :players
  has_many :turns
  has_many :cards

  after_create :create_deck

  def create_deck
   field_names = ['rank','suit','rule','url']
    failure_count = 0 
    Card.transaction do 
      File.open("db/data/cards.csv").each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin 
          print attribute_hash
          Card.create!(attribute_hash)
          print '.'
        rescue ActiveRecord::UnknownAttributeError
          failure_count += 1
          print '!'
        ensure 
          STDOUT.flush
        end
      end
    end
    failures = failure_count > 0 ? "(failed to create #{failure_count} card records)" : ''
    puts "\nDone #{failures}\n\n"
  end

end