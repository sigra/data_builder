require 'ffaker'

require 'data_builder/incremental_price'
require 'data_builder/block'
require 'data_builder/info'

module DataBuilder
  autoload :Info, 'data_builder/info'
  autoload :IncrementalPrice, 'data_builder/incremental_price'
  autoload :Block, 'data_builder/block'

  def self.build(options = {})
    @booking_id = options.delete(:booking_id) || Random.new.rand(10_000..20_000)
    hash = DataBuilder::Info.render({ hotel_id: @booking_id })

    hash[:block] = 3.times.map { DataBuilder::Block.render({ booking_id: @booking_id }) }

    hash
  end
end
