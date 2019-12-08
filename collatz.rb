def find_largest_collatz_chain(start, finish)
  known_lengths = {1 => 1}
  return_value = 1

  (start..finish).each do |num|
    current_length = collatz_length(num, known_lengths)
    if current_length > known_lengths[return_value]
      return_value = num
    end
    known_lengths[num] = current_length
  end
  return return_value

end

def collatz_length(num, known_lengths)
  chain_length = 1
  while num > 1
    if known_lengths[num]
      return chain_length + known_lengths[num]
    end
    num = next_collatz(num)
    chain_length += 1
  end
  return chain_length
end

def next_collatz(num)
  return num / 2 if num.even?
  return (3 * num) + 1
end

puts find_largest_collatz_chain(1, 1_000_000)


require 'benchmark'
Benchmark.bm do |x|
  x.report("find_largest_collatz_chain") { find_largest_collatz_chain(1, 1_000_000) }
end