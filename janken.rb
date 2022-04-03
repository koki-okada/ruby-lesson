# ジャンケンの関数
def janken
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  player_hand = gets.to_i
  puts "ホイ!"
  
  hand = ["グー", "チョキ", "パー"]
  computer_hand = rand(3).to_i
  
  puts "----------------------------"
  puts "あなた:#{hand[player_hand]}を出しました"
  puts "相手:#{hand[computer_hand]}を出しました"
  puts "----------------------------"  
  
  # あいこの場合
  if player_hand == computer_hand
    puts "あいこで..."
    
  #勝ちの場合 
  elsif player_hand == 0 && computer_hand == 1 || player_hand == 1 && computer_hand == 2 || player_hand == 2 && computer_hand == 0
    case_no = 1
    puts acchimuite_hoi(case_no)
    
  #負けの場合 
  elsif player_hand == 0 && computer_hand == 2 || player_hand == 1 && computer_hand == 0 || player_hand == 2 && computer_hand == 1
    case_no = 2
    puts acchimuite_hoi(case_no)
  else
    puts "じゃんけんを終了します"
  end
end

# あっちむいてほいの関数
def acchimuite_hoi(case_no)
  puts "あっち向いて~"
  puts "0(上)1(下)2(左)3(右)"
  player_direction = gets.to_i
  puts "ホイ！"
  
  direction = ["上","下","左","右"]
  computer_direction = rand(3).to_i
  
  puts "----------------------------"
  puts "あなた:#{direction[player_direction]}"
  puts "相手:#{direction[computer_direction]}"
  puts "----------------------------"  
  
  if case_no == 1 && player_direction == computer_direction
    puts "あなたの勝ちです"
    exit
  elsif case_no == 2 && player_direction == computer_direction
    puts "あなたの負けです"
    exit
  else
    puts "じゃんけん..."
  end
end

puts "じゃんけん..."

while true
  janken
end

