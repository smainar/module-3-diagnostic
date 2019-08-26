class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :distance,
              :access_times

  def initialize(search_info)
    @name = search_info[:station_name]
    @address = search_info[:station_address]
    @fuel_type = search_info[:fuel_type_code]
    @distance = search_info[:distance]
    @access_times = search_info[:access_days_times]
  end
end
