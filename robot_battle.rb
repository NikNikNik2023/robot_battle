# Объявляем массивы

@arr1 = Array.new(10, 100)
@arr2 = Array.new(10, 100)

# Атака

def attack(arr)
  sleep 1
  robot_index = rand(0..9)
  damage = rand(30..100) #  урон
  health = arr[robot_index] - damage # уровень здоровья после нанесения урона
  if health <= 0
    arr[robot_index] = 0
    puts "Робот по индексу #{robot_index} уничтожен"
  else
    arr[robot_index] = health
    puts "Робот по индексу #{robot_index} повреждён, нанесено урона #{damage}, осталось здоровья #{health}"
  end
end

# Проверка победы

def victory?
  @robots_left1 = @arr1.count { |x| x.positive? }
  @robots_left2 = @arr2.count { |x| x.positive? }

  if @robots_left1.zero?
    puts "Команда 2 победила, в команде осталось #{@robots_left2} робота"
    return true
  end

  if @robots_left2.zero?
    puts "Команда 1 победила, в команде осталось #{@robots_left1} робота"
    return true
  end

  false
end

# Статистика

def stats
  puts "1-ая команда: #{@robots_left1} роботов в строю #{@arr1}"
  puts "2-ая команда: #{@robots_left2} роботов в строю #{@arr2}"
end

# Главный цикл

loop do
  puts "Первая команда наносит удар..."
  attack(@arr2)
  exit if victory?
  stats
  sleep 3

  puts

  puts "Вторая команда наносит удар..."
  attack(@arr1)
  exit if victory?
  stats
  sleep 3

  puts
end

