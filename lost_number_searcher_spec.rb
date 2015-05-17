require 'rspec'

require './lost_number_searcher'

def get_test_data
  lost_number = rand(10000)
  { :lost_number => lost_number, :data => ((1..10000).to_a - [lost_number]) }
end

describe LostNumberSearcher do
  let(:input){get_test_data}
  context '合計の差方式' do
    it '正常に検索ができる' do
      result = LostNumberSearcher::SumAlgorithm.search input[:data]
      expect(result).to eq(input[:lost_number])
    end
  end

  context '差集合方式' do
    it '正常に検索ができる' do
      result = LostNumberSearcher::RelativeComplementAlgorithm.search input[:data]
      expect(result).to eq(input[:lost_number])
    end
  end

  context '二部探索方式' do
    it '正常に検索ができる' do
      result = LostNumberSearcher::SearchAlgorithm.search input[:data].sort
      expect(result).to eq(input[:lost_number])
    end
  end
end
