def lucky
  return Random.rand(101)
end

def generate_face
  num = 64 - Random.rand(31)
  return num.chr
end

def stop
  1.times.map{ puts "\n" }
end

def double_stop
  stop
  stop
end

def wait
  11.times.map{ puts "\n" }
end

def whoa
  11.times.map { puts "\n"}
end

def say phrase
  print phrase + "\n"
end

def generate_stats
  # 0 = health
  stats = 1.times.map{ 100 - Random.rand(101) }
  # add health
  stats << 100
end

def generate_monster_stats level
  stats = generate_stats
  stats[-1] = stats[-1] * level * 10
  return stats
end

### START GAME
level = 0
e = 2.17128
player_stats = generate_stats
wait
say "Press enter to start"
gets

while true
  level += 1
  player_stats[0] += level * 10
  monster_stats = generate_monster_stats level
  monster_face = generate_face.to_s

  # start encounter
  while true
    stop
    print "{ " + monster_face.chr + " ___ " + monster_face.chr + " }"
    wait
    say "Monster health: " + monster_stats[-1].to_s
    say "Your stats: " + player_stats.to_s
    say "Type your [super attack] to attack!"
    stop
    unless monster_stats[-1] < 1
      monster_stats[-1] -= player_stats[0]
      gets
      next
    end
    break
  end
end
