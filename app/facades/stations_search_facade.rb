class StationsSearchFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do |f|
      f.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
      f.params["limit"] = 10
      f.adapter Faraday.default_adapter
    end

    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?fuel_type=ELEC,LPG&location=#{@zip_code}&radius=6.0&access=public")

    station_search_info = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    station_search_info.map do |station_info|
      Station.new(station_info)
    end
  end
end
