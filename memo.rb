require "csv"

puts '1(新規でメモを作成) 2(既存のメモを編集する)'
input_number = gets.to_i

if input_number == 1
  puts "----------------------------"
  puts "拡張子を除いたファイル名を入力してください"
  puts "----------------------------"
  input_filename = gets.chomp.to_s
  
  puts "----------------------------"
  puts "メモを入力してください"
  puts "完了したらctrl + dを押します"
  puts "----------------------------"
  input_memo = readlines.map &:chomp
  
  puts "以下の内容でメモを登録しました"
  puts "----------------------------"
  puts "ファイル名:#{input_filename}"
  puts "----------------------------"
  puts "内容:#{input_memo}"
  puts "----------------------------"
  
  csv_name = "#{input_filename}.csv"
  
  CSV.open(csv_name,'w', :force_quotes => true) do |csv|
    csv << [input_memo]           ##データ１行目
  end
  
elsif input_number == 2
  memo_list = []
  
  puts "----------------------------"
  puts "編集するメモの番号を選択してください"
  Dir.glob('*.csv') do |m|
    memo_list << m
  end
  puts "----------------------------"
  
  memo_no = 0
  
  memo_list.each{|memo|
    puts "#{memo_no}.#{memo}"
    memo_no += 1
  }
  
  puts "----------------------------"
  
  edit_no = gets.to_i
  edit_memo = memo_list[edit_no]

  puts "----------------------------"
  puts "メモを入力してください"
  puts "完了したらctrl + dを押します"
  puts "----------------------------"
  
  memo = readlines.map &:chomp
  
  CSV.open(edit_memo,'w', :force_quotes => true) do |csv|
    csv << [memo]           ##データ１行目
  end
  
  puts "/n"
  puts "----------------------------"
  puts "メモの編集に成功しました"
  puts "----------------------------"
  
  CSV.foreach(edit_memo) do |f|
   print f
  end
  
else
  puts "1か2を選択してください"
end
