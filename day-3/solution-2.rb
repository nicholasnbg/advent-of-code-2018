file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

claims = input.split("\n")

grid = Array.new(1000) { Array.new(1000, 0) }

claims.each do |claim|
  x,y = claim.split('@')[1].split(':')[0].split(',').map(&:to_i)
  width, height = claim.split('@')[1].split(':')[1].split('x').map(&:to_i)

  width.times do |col|
    height.times do |row|
      grid[x+col][y+row] += 1
    end
  end
end

clean_claim = nil

claims.each do |claim|
  all_1 = true

  claim_no = claim.split('@')[0]
  x,y = claim.split('@')[1].split(':')[0].split(',').map(&:to_i)
  width, height = claim.split('@')[1].split(':')[1].split('x').map(&:to_i)

  width.times do |col|
    height.times do |row|
      all_1 = false if grid[x+col][y+row] != 1
    end
  end

  clean_claim = claim_no if all_1
end

print clean_claim