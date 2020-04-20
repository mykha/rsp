# encoding : cp866
#счет игры (изначально 0:0)
score = {:user=>0, :comp=>0}
# в массиве сохранены отношения, у кого меньше индекс, тот и победил
arr_range = [[:rock, :scissors], [:scissors, :paper], [:paper, :rock]]
# варианты ответов
arr = [:rock, :scissors, :paper]
user_range_index = nil
winplace = nil
loop do
	puts "Общий счет : Вы(#{score[:user]}):Компьютер(#{score[:comp]})"
	print "Сделайте ваш выбор R(rock), S(scissors), P(paper)"
	user_choice_str = gets.strip.downcase[0]
	comp_choice = arr[rand(0..2)]
	if "rsp".include?(user_choice_str) 
		user_choice = arr["rsp".index(user_choice_str)]
		puts "Ваш выбор #{user_choice.to_s.capitalize}"
		puts "Выбор компьютера #{comp_choice.to_s.capitalize}"

		if user_choice == comp_choice 
			puts "Ничья !"
		else
			#в каждом подмассивчике ищем ответ пользователя и компьютера
			arr_range.each_with_index do |item, idx|
				user_range_index = item.index(user_choice)
				comp_range_index = item.index(comp_choice)
				#если нашли подмассивчик, где есть оба ответа, прекращаем поиск
				if (user_range_index != nil) && (comp_range_index != nil) 
					winplace = idx
					break
				end	
			end
			#если индекс равен 0, то пользователь выиграл
			if user_range_index==0	
				puts "Вы выиграли !"
				score[:user]+=1
			else
				puts "Выиграл компьютер :("
				score[:comp]+=1
			end
			puts arr_range[winplace].index(user_choice) < arr_range[winplace].index(comp_choice)
		end
	else
		puts "Непонятный выбор. Нажмите одну из клавиш - r , s или p"
	end
end
