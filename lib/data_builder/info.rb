module DataBuilder
  class Info
    attr_accessor :hash

    def initialize(options = {})
      @hash = {
        hotel_id: options.delete(:booking_id) || options.delete(:hotel_id),
        hotel_text: options.delete(:hotel_text) || '',
        arrival_date: format_date(options.delete(:arrival_date) || Date.today),
        departure_date: format_date(options.delete(:arrival_date) || Date.tomorrow)
      }
    end

    def self.render(options = {})
      self.new(options).hash
    end

    private

    def format_date(date)
      date.strftime("%Y-%m-%d")
    end
  end
end