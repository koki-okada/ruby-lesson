require "csv"

puts '1(新規でメモを作成) 2(既存のメモを編集する)'
input_number = gets.to_i

if input_number == 1
  puts "----------------------------"
  puts "拡張子を除いたファイル名を入力してください"
  puts "----------------------------"
  input_filename = gets.to_s
  filename = input_filename.chomp
  
  puts "----------------------------"
  puts "メモを入力してください"
  puts "完了したらEnterを押します"
  puts "----------------------------"
  input_memo = gets.to_s
  memo = input_memo.chomp
  
  puts "以下の内容でメモを登録しました"
  puts "----------------------------"
  puts "ファイル名:#{filename}"
  puts "----------------------------"
  puts "内容:#{memo}"
  puts "----------------------------"
  
  csv_name = "#{filename}.csv"
  
  CSV.open(csv_name,'w', :force_quotes => true) do |csv|
    csv << [filename]        ##ヘッダ
    csv << [memo]           ##データ１行目
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
  puts "拡張子を除いたファイル名を入力してください"
  puts "----------------------------"
  
  filename = gets.to_s
  after_filename = filename.chomp

  puts "----------------------------"
  puts "メモを入力してください"
  puts "完了したらEnterを押します"
  puts "----------------------------"
  memo = gets.to_s
  after_memo = memo.chomp
  
  CSV.open(edit_memo,'w', :force_quotes => true) do |csv|
    csv << [after_filename]        ##ヘッダ
    csv << [after_memo]           ##データ１行目
  end
  
  puts "----------------------------"
  puts "メモの編集に成功しました"
  puts "----------------------------"
  
  
  CSV.foreach(edit_memo) do |f|
   print f
  end
  
else
  puts "1か2を選択してください"
end
