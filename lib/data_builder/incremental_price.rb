module DataBuilder
  class IncrementalPrice
    attr_accessor :hash

    def initialize(price = nil, currency = 'EUR')
      price ||= Random.new.rand(10_00..200_00).to_f / 100
      @hash = {
        price: price,
        currency: currency
      }
    end

    def self.render(price = nil, currency = 'EUR')
      self.new(price, currency).hash
    end
  end
end
