require 'benchmark'
require './lost_number_searcher'

n = 10000

Benchmark.bm do |x|
  x.report{ n.times { |i| LostNumberSearcher::SumAlgorithm.search((1..10000).to_a - [i + 1]) } }
  x.report{ n.times { |i| LostNumberSearcher::RelativeComplementAlgorithm.search((1..10000).to_a - [i + 1]) } }
  x.report{ n.times { |i| LostNumberSearcher::SearchAlgorithm.search((1..10000).to_a - [i + 1]) } }
end