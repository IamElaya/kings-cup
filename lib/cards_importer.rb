class CardsImporter

  def initialize(file-name=File.absolute_path('db/data/cards.csv'))
    @filename = filename
  end


  def import 
    field_names = ['rank','suit','rule']
    puts "importing cards from '#{@filename}'"
    failure_count = 0 
    Card.transaction do 
      File.open(@filename).each do |line|
        data = line.chomp.split(,)
        attribute_hash = Hash[field_names.zip(data)]
        begin 
          print attribute_hash
          Card.create!(attribute_hash)
          print '.'
        rescue ActiveRecord::unknownAttributeError
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
