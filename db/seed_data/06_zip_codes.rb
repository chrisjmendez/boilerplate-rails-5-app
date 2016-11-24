require 'csv'

class CSVUtil    
  def read(file)
    CSV.read(file, headers: true, header_converters: :symbol, skip_blanks: true)		
  end
	
  #This example simply iterates through each item one-by-one
  def read_each(file)
    CSV.foreach(file, headers: true, header_converters: :symbol, skip_blanks: true) do |row|
      #guard	
      break if $. > 5
      puts row
    end				
  end
end

class ZipCodeUtil
  
  CURRENT_DIR = File.dirname(__FILE__)  
  INPUT_FILE = File.join(CURRENT_DIR, "raw_data", "free-zipcode-database.csv")
  
  def initialize
    import
  end
  
  def import
    #Create a new CSV Utility Object
    csv = CSVUtil.new

    #Collect an array of CSV Objects
    rows = csv.read(INPUT_FILE)
    
    locations = rows.each_with_index.map do |row, idx|
      puts %{ #{idx} out of #{rows.size} }
      
      Location.create(
      :zip_code       => row[:zip_code],
      :zip_code_type  => row[:zipcodetype],
      :city           => row[:city],
      :state          => row[:state],
      :lat            => row[:lat].to_f,
      :lng            => row[:long].to_f,
      :country        => row[:country],
      :location_text  => row[:locationtext],
      :location       => row[:location],
      :estimated_population => row[:estimatedpopulation],
      :total_wages    => row[:totalwages] 
      )
    end
  end
end

ZipCodeUtil.new
