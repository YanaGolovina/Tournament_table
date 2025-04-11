# def update(answers, tree, x, l, r, participant)
#   if participant[1] == nil 
#     return
#   end
#   if r - l == 1
#     answers[l] = participant
#     return
#   end

  
#   if !tree[2 * x].include?(participant[1]) || (tree[2 * x + 1].include?(participant[1]) && tree[2 * x][participant[1]] <= tree[2 * x + 1][participant[1]])
#     if tree[2 * x].include?(participant[1])
#       tree[2 * x][participant[1]] += 1
#     else
#       tree[2 * x][participant[1]] = 1
#     end
#     update(answers, tree, 2 * x, l, (l + r) / 2, participant)
#   else
#     if tree[2 * x + 1].include?(participant[1])
#       tree[2 * x + 1][participant[1]] += 1
#     else
#       tree[2 * x + 1][participant[1]] = 1
#     end
#     update(answers, tree, 2 * x + 1, (l + r) / 2, r, participant)
#   end
  
  
#   if tree[x].include?(participant[1])
#     tree[x][participant[1]] += 1
#   else
#     tree[x][participant[1]] = 1
#   end
# end

# def solve(participants)
#   answers = Array.new(participants.size)
#   tree = Array.new(4 * participants.size) { Hash[foo: 0] }

#   participants.each do |participant|
#     update(answers, tree, 1, 0, participant.size, participant)
#   end

#   pairs = []
#   for i in (0...participants.size).step(2);
#     pairs << [answers[i], answers[i+1]];
#   end
#   return pairs
# end

# participants = [
#   ['A1', 'City1'],
#   ['B1', 'City2' ],
#   ['C1', 'City1' ],
#   ['D1', 'City3' ],
#   ['A2', 'City4' ],
#   ['B2', 'City2' ],
#   ['C2', 'City5' ],
#   ['D2', 'City2' ]
# ]
# # answers = Array.new(participants.size)
# # tree = Array.new(4 * participants.size) { Hash[foo: 0] }

# # participants.each do |participant|
# #   update(answers, tree, 1, 0, participant.size, participant)
# # end
# participants.sort!
# pairs = []
# for i in (0...participants.size).step(2);
#   pairs << [answers[i], answers[i+1]];
# end
# print(pairs)
# # return pairs
# print(solve(participants))

def reverse_bits(num, num_bits)
  result = ""
  num_bits.times do |i|
    result << num[i].to_s
  end
  return result.to_i(2)
end

def create_pairs(participants)
  ans = Array.new(participants.size)
  participants.sort_by! { |p| p[1] }
  num_bits = Math.log2(participants.size).ceil
  for i in 0...participants.size
    j = reverse_bits(i, num_bits)
    ans[j] = participants[i][0], participants[i][1]
  end

  pairs = ans.each_slice(2).to_a
  return pairs
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