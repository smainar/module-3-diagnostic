class NrelService
  def stations_by_zip(zip_code)
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do |f|
      f.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
      f.params["limit"] = 10
      f.adapter Faraday.default_adapter
    end
    
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?fuel_type=ELEC,LPG&location=#{zip_code}&radius=6.0&access=public")

    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end
end
