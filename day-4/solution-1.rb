file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)
require_relative "./lib/day"

logs = input.split("\n")
# logs = ["[1518-05-22 00:47] wakes up"]

months = []

(1..11).each do |month|
  array = [] 
  
  (1..31).each do |day|
    new_day = Day.new(month, day)
    array << new_day
  end

  months << array
end

guards = {

}

# Create full set of data from logs  
logs.each do |log|
  month,day_of_log = log.split(' ')[0].split('-')[1..3].map(&:to_i)
  day_obj = months[month-1].select { |x| x.day == day_of_log}[0]
  time = log.split(' ')[1][0...-1]
  last =  log.split(' ').last
  type = nil
  if last == "shift"
    guard = log.split(' ')[3]
    guard[0] = ''
    day_obj.guard = guard
    guards[guard] = 0 unless guards[guard]
  elsif last == "up"
    day_obj.awake = time
  else
    day_obj.asleep = time
  end
end

# Remove empty days
months.map! do |month|
  month.select! do |day| 
    day.guard != nil
  end
end

months.select! { |month| month.size >0 }

# Total each guard minutes
months.each do |month|
  month.each do |day|
    guard = day.guard
    sleep_time = day.asleep.to_i
    awake_time = day.awake.to_i
    puts day.awake.split(":")
    guards[guard] += awake_time - sleep_time
  end 
end

print guards