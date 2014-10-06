class Pemain
#variabel
	@@nama = []
	@@mana = []
	@@hp   = []
#constructor
	def initialize
	end
#method add_player
	def add_player
		if jml_pemain >= 3
			puts 'jumlah pemain maksimal 3'	
		else			
			puts 'Masukkan Nama Player :'	
			STDOUT.flush
			input_nama = gets.chomp	
			
			#manggil method ketersediaan nama
			avail_nama = avail_name_on(input_nama)	
			if avail_nama == false
				@@nama=@@nama.push(input_nama)
				@@mana=@@mana.push(40)
				@@hp=@@hp.push(100)
			else
	
				puts 'Nama sudah ada bos!'
			
			end
		end
	end
#method avail_name_on
	def avail_name_on p_input_nama
		if @@nama.include?(p_input_nama)
			return true
		else
			return false
		end
	end
#method current_players(view player)
	def current_players
		if @@nama.length == 0
			puts 'tidak ada pemain terdaftar'
		else
			for i in 0..@@nama.length-1
				puts "#{@@nama[i]}, #{@@mana[i]}, #{@@hp[i]}"
			end
		end
	end
#method Jumlah pemain terdaftar
	def jml_pemain
		return @@nama.length
	end

#method battle_start
	def battle_start
		print 'masukkan nama penyerang :'
		STDOUT.flush
		input_penyerang = gets.chomp
		print 'masukkan nama yang diserang :'
		STDOUT.flush
		input_diserang = gets.chomp
		if input_penyerang == input_diserang
			puts 'Nama penyerang tidak boleh sama dengan nama diserang'
		elsif avail_name_on(input_penyerang) == false && avail_name_on(input_diserang) == false
			puts 'tidak ada nama penyerang dan diserang'
		elsif avail_name_on(input_penyerang) == false
			puts 'nama penyerang tidak ada'
		elsif avail_name_on(input_diserang) == false
			puts 'nama diserang tidak ada'
		elsif cek_mana(input_penyerang) == false
			puts 'mana tidak cukup'
		elsif cek_hp(input_penyerang) == false
			puts 'hp tidak cukup'
		elsif cek_hp(input_diserang) == false
			puts 'hp sudah habis'
		else
		 	func_battle(input_penyerang, input_diserang)
		end
	end
#method cek_mana
	def cek_mana p_input_nama
		index = @@nama.index(p_input_nama)
		if @@mana[index] >= 20
			return true
		else
			return false
		end
	end	
#method cek_hp
	def cek_hp p_input_nama
		index = @@nama.index(p_input_nama)
		if @@hp[index] > 0
			return true
		else
			return false
		end
	end
#method func_battle
	def func_battle p_input_penyerang, p_input_diserang
		#index penyerang
			index_p = @@nama.index(p_input_penyerang)
		#index diserang
			index_s = @@nama.index(p_input_diserang)
		puts '#BATTLE START !!!#'
		puts 'Nama Penyerang : '+p_input_penyerang
		puts 'Nama diserang : '+p_input_diserang
		@@mana[index_p] = @@mana[index_p]-20
		@@hp[index_s] = @@hp[index_s]-20
		puts 'Description :'
		puts "#{@@nama[index_p]}: Mana=#{@@mana[index_p]}, Darah = #{@@hp[index_p]}"
		puts "#{@@nama[index_s]}: Mana=#{@@mana[index_s]}, Darah = #{@@hp[index_s]}"
	end	
end
	
