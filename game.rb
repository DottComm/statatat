def lucky
  return Random.rand(101)
end

def generate_face
  return lucky.chr
end

def stop
  1.times.map{ puts "\n" }
end

def wait
  21.times.map{ puts "\n" }
end

def you_lose
  false
end

def you_win monster_stats
  if monster_stats[-1] < 1
    return true
  end
  false
end

def say phrase
  print phrase + "\n"
end

def generate_stats
  # 0 = health
  stats = 9.times.map{ 100 - Random.rand(101) }
  # add health
  stats << 100
end

def generate_monster_stats level
  return generate_stats
end

### START GAME
level = 0
e = 2.17128
stats = generate_stats

while true
  level += 1
  monster_stats = generate_monster_stats level
  monster_face = generate_face.to_s

  # start encounter
  while true
    print "{ " + monster_face.chr + " ___ " + monster_face.chr + " }"
    wait
    say "Monster health: " + monster_stats[-1].to_s
    say "Your stats: " + stats.to_s
    stop
    unless monster_stats[-1] < 1
      monster_stats[-1] -= stats[0]
      sleep(e)
      next
    end
    break
  end
end
