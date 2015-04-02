module DataBuilder
  class Block
    attr_accessor :hash

    def initialize(options = {})
      @booking_id = options.delete(:booking_id) || Random.new.rand(2000..10000)
      @min_price  = options.delete(:min_price) || Random.new.rand(10_00..200_00).to_f / 100
      @rack_rate  = options.delete(:rack_rate) || 0.0

      @hash = {
        name: options.delete(:name) || FFaker::Company.name,
        photos: '',
        block_id: options.delete(:block_id) || build_block_id,
        min_price: build_min_price,
        rack_rate: { price: @rack_rate, currency: 'EUR' },
        block_text: options.delete(:block_text) || '',
        refundable: options.delete(:refundable) || Random.new.rand(0..1),
        max_occupancy: options.delete(:max_occupancy) || Random.new.rand(1..5),
        deposit_required: options.delete(:deposit_required) || Random.new.rand(0..1),
        refundable_until: options.delete(:refundable_until) || '',
        incremental_price: 3.times.map{ DataBuilder::IncrementalPrice.render },
        breakfast_included: options.delete(:breakfast_included) || Random.new.rand(0..1)
      }
    end

    def self.render(options = {})
      self.new(options).hash
    end

    private

    def build_block_id
      "#{ @booking_id }0#{ rand(1..9) }_#{ rand(30000..50000) }_#{ rand(100..200) }"
    end

    def build_min_price
      {
        price: @min_price,
        currency: 'EUR'
      }
    end
  end
end
