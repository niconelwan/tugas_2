require_relative 'Pemain'
class Menu
	pilihan = '0'
	while (pilihan !='3')
		puts '#=========================#'
		puts '# Welcome to BattleGround #'
		puts '#-------------------------#'
		puts '#Description : #'
		puts '	1. masukkan pilihan untuk membuat nama'
		puts '	2. masukkan pilihan untuk menyerang'
		puts '	3. Keluar'
		print ' Current Player :'
		#buat object
		object_player = Pemain.new
		jml_pemain = object_player.jml_pemain
		puts jml_pemain		
		object_player.current_players	
		print' Pilihan :'
		STDOUT.flush
		pilihan = gets.chomp
		puts "\n"
	
		if pilihan == '1'
			object_player.add_player
		elsif pilihan == '2'
			object_player.battle_start
		elsif pilihan =='3'
			puts 'keluar'
		else
			puts 'pilihan tidak ada'
		end
	end		

end
