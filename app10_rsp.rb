# encoding : cp866
#game score (initially 0:0)
score = {:user=>0, :comp=>0}
# relations are kept in the array, whose index is lower - he won
arr_range = [[:rock, :scissors], [:scissors, :paper], [:paper, :rock]]
# varied answers
arr = [:rock, :scissors, :paper]
user_range_index = nil
winplace = nil
loop do
	puts "Total score : YOU(#{score[:user]}):COMPUTER(#{score[:comp]})"
	print "Make your choice R(rock), S(scissors), P(paper)"
	user_choice_str = gets.strip.downcase[0]
	comp_choice = arr[rand(0..2)]
	if "rsp".include?(user_choice_str) 
		user_choice = arr["rsp".index(user_choice_str)]
		puts "Your choice is #{user_choice.to_s.capitalize}"
		puts "Computer choice is #{comp_choice.to_s.capitalize}"

		if user_choice == comp_choice 
			puts "Draw !"
		else
			#in each subarray we look for the response of the user and the computer
			arr_range.each_with_index do |item, idx|
				user_range_index = item.index(user_choice)
				comp_range_index = item.index(comp_choice)
				#if we find a subarray where there are both answers - stop the search
				if (user_range_index != nil) && (comp_range_index != nil) 
					winplace = idx
					break
				end	
			end
			#if the index is 0 then the user won
			if user_range_index==0	
				puts "You won !"
				score[:user]+=1
			else
				puts "Computer won :("
				score[:comp]+=1
			end
			puts arr_range[winplace].index(user_choice) < arr_range[winplace].index(comp_choice)
		end
	else
		puts "Wrong choice. Please, press one of the keys - r , s or p"
	end
end
