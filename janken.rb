puts "じゃんけん..."

# ジャンケンの関数
def janken
  while true
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    player_hand = gets.to_i
    puts "ホイ!"
    
    hand = ["グー", "チョキ", "パー"]
    computer_hand = rand(0)
    # computer_hand = rand(3)
    
    puts "----------------------------"
    puts "あなた:#{hand[player_hand]}を出しました"
    puts "相手:#{hand[computer_hand]}を出しました"
    puts "----------------------------"  
    
    # あいこの場合
    if player_hand == computer_hand
      puts "あいこで..."
      return true
     
    #勝ちの場合 
    elsif player_hand == 0 && computer_hand == 1 || player_hand == 1 && computer_hand == 2 || player_hand == 2 && computer_hand == 0
      player = win
      LookThatWay(player)
    #負けの場合 
    elsif player_hand == 0 && computer_hand == 2 || player_hand == 1 && computer_hand == 0 || player_hand == 2 && computer_hand == 1
       player = lose
       LookThatWay(player)
    else
      puts "じゃんけんを終了します"
    end
  end
end

# あっちむいてほいの関数
def LookThatWay(player)
  if player == win
  
  end
end

janken
