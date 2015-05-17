# encoding: utf-8

module LostNumberSearcher
  # ロストナンバーが１つなら要素の合計の差分で算出できる
  module SumAlgorithm
    def self.search(data)
      (1..10000).to_a.inject(:+) - data.inject(:+)
    end
  end

  # Ruby標準の差集合計算
  module RelativeComplement
    def self.search(data)
      ((1..10000).to_a - data).first
    end
  end

  # ソートして二分探索で探す
  module SearchAlgorithm
    def self.search(data)
      binary_search(data.sort)
    end

    def self.binary_search(data, offset = 0)
      index = get_search_index(data.length)
      search_data = index + offset+ 1

      if data[index] == search_data && data[index + 1] != search_data + 1
        return search_data + 1
      end
      if data[index] == search_data
        binary_search(data[(index + 1)..-1], search_data)
      else
        binary_search(data[0...index],offset)
      end
    end

    def self.get_search_index(length)
      length.even? ? (length / 2)  : (length - 1) / 2
    end
  end
end

if $0 ==  __FILE__
  p LostNumberSearcher::SumAlgorithm.search((1..10000).to_a - [7777])
  include LostNumberSearcher
  p SearchAlgorithm.search((1..10000).to_a - [7777])
end