# encoding : cp866
#��� ���� (����砫쭮 0:0)
score = {:user=>0, :comp=>0}
# � ���ᨢ� ��࠭��� �⭮襭��, � ���� ����� ������, �� � �������
arr_range = [[:rock, :scissors], [:scissors, :paper], [:paper, :rock]]
# ��ਠ��� �⢥⮢
arr = [:rock, :scissors, :paper]
user_range_index = nil
winplace = nil
loop do
	puts "��騩 ��� : ��(#{score[:user]}):��������(#{score[:comp]})"
	print "������� ��� �롮� R(rock), S(scissors), P(paper)"
	user_choice_str = gets.strip.downcase[0]
	comp_choice = arr[rand(0..2)]
	if "rsp".include?(user_choice_str) 
		user_choice = arr["rsp".index(user_choice_str)]
		puts "��� �롮� #{user_choice.to_s.capitalize}"
		puts "�롮� �������� #{comp_choice.to_s.capitalize}"

		if user_choice == comp_choice 
			puts "����� !"
		else
			#� ������ ������ᨢ稪� �饬 �⢥� ���짮��⥫� � ��������
			arr_range.each_with_index do |item, idx|
				user_range_index = item.index(user_choice)
				comp_range_index = item.index(comp_choice)
				#�᫨ ��諨 ������ᨢ稪, ��� ���� ��� �⢥�, �४�頥� ����
				if (user_range_index != nil) && (comp_range_index != nil) 
					winplace = idx
					break
				end	
			end
			#�᫨ ������ ࠢ�� 0, � ���짮��⥫� �먣ࠫ
			if user_range_index==0	
				puts "�� �먣ࠫ� !"
				score[:user]+=1
			else
				puts "�먣ࠫ �������� :("
				score[:comp]+=1
			end
			puts arr_range[winplace].index(user_choice) < arr_range[winplace].index(comp_choice)
		end
	else
		puts "�������� �롮�. ������ ���� �� ������ - r , s ��� p"
	end
end
