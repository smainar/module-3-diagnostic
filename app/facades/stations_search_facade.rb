class SearchStationsFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do |f|
      f.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
      f.params["limit"] = 10
      f.adapter Faraday.default_adapter
    end
  end
end
