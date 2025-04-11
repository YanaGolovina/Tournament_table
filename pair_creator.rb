def reverse_bits(num, num_bits)
  result = ""
  num_bits.times do |i|
    result << num[i].to_s
  end
  return result.to_i(2)
end

def solve(participants)
  ans = Array.new(participants.size)
  participants.sort_by! { |p| p[1] }
  num_bits = Math.log2(participants.size).ceil
  for i in 0...participants.size
    j = reverse_bits(i, num_bits)
    ans[j] = participants[i]
  end

  pairs = []
  for i in (0...participants.size).step(2);
    pairs << [ans[i], ans[i+1]];
  end
  pairs
end

# participants = [
#   ['A1', 'A'],
#   ['A2','A' ],
#   ['B1','B' ],
#   ['B2','B' ],
#   ['C1','C' ],
#   ['C2','C' ],
#   ['D1','D' ],
#   ['D2','D' ]
# ]

# pairs = solve(participants)
# /print(pairs)