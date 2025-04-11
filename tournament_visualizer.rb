def visualize_tournament(pairs)
  g = Gruff::Graph.new
  g.title = 'Турнирная сетка'

  pairs.each_with_index do |pair, index|
    g.data("Пара #{index + 1}", [index + 1, index + 1])
  end

  g.write('tournament_graph.png')
end
