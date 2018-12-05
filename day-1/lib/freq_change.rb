class FrequencyChanger
  def new_freq(freqs_arr)
    freqs_arr.sum()
  end

  def first_repeat(freqs_arr)
    sum = 0
    sums = Set.new

    while true
      freqs_arr.each do |change|
        sum += change.to_i

        if sums.include?(sum)
          return sum
          exit
        end
      sums.add(sum)
    end
  end
end
end