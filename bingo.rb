# ビンゴカードのサイズを入力
s = gets.to_i

# ビンゴカードの単語を入力  
bingo = []
s.times do
  bingo << gets.split
end

# 選ばれた単語の数を入力
n = gets.to_i  

# 選ばれた単語を入力
words = [] 
n.times do
  words << gets.chomp
end

# ビンゴカードに印をつける
marked = Array.new(s) { Array.new(s, false) }
words.each do |word|
  bingo.each_with_index do |row, i|
    row.each_with_index do |col, j|
      if col == word
        marked[i][j] = true
      end
    end
  end
end

# 勝利条件をチェック
def check_bingo(marked, s)
  # 横方向
  marked.each do |row|
    return true if row.all?
  end
  
  # 縦方向
  (0...s).each do |j|
    return true if marked.all? { |row| row[j] }
  end

  # ななめ(\)方向
  return true if (0...s).all? { |i| marked[i][i] }

  # ななめ(/)方向
  return true if (0...s).all? { |i| marked[i][s-i-1] }  

  return false
end

if check_bingo(marked, s)
  puts "yes"
else
  puts "no"  
end