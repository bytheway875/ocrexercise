class OCR
	def initialize(text)
		@text = text
	end

	def parse_rows(text)
		text.split(/\n\s*\n/)
	end

	def convert

		 each_row = self.parse_rows(@text)

		 final_array = []

		 last_row = each_row.count
		 each_row.each_with_index do |row, index|
		 	row_lines = row.split(/\n/)

		 	top = row_lines[0].scan(/.{3}/) 
    		middle = row_lines[1].scan(/.{3}/) 
   			bottom = row_lines[2].scan(/.{3}/)

   			elements = top.length

   			for i in 0..(elements - 1)
      			final_array << "#{top[i]}\n#{middle[i]}\n#{bottom[i]}\n"
    		end

    		if (each_row.length-1) != index
    			final_array << ","
    		end
    	end


    	# def ocr_to_integer(ocr)
    	# 	ocr_integer = {
    	# 		" _ \n| |\n|_|\n" => 0,
    	# 		# fill in the rest
    	# 	}
    	# 		if ocr_integer[ocr] == nil
    	# 			return "?"
    	# 		else ocr_integer[ocr]
    	# 			return ocr_integer[ocr]
    	# 		end

    	# end

    	string = ""
	    final_array.each do |text|
	      if text == " _ \n| |\n|_|\n"
	        string << "0"
	      elsif text == "   \n  |\n  |\n"
	        string << "1"
	      elsif text == " _ \n _|\n|_ \n"
	        string << "2"
	      elsif text == " _ \n _|\n _|\n"
	        string << "3"
	      elsif text == "   \n|_|\n  |\n"
	        string << "4"
	      elsif text == " _ \n|_ \n _|\n"
	        string << "5"
	      elsif text == " _ \n|_ \n|_|\n"
	        string << "6"
	      elsif text == " _ \n  |\n  |\n"
	        string << "7"
	      elsif text == " _ \n|_|\n|_|\n"
	        string << "8"
	      elsif text == " _ \n|_|\n _|\n"
	        string << "9"
	      elsif text == ","
	      	string << ","
	      else 
	        string << "?"
	      end
	    end
    return string
	end
end


ocr_integer = {" _ \n| |\n|_|\n" => 0}