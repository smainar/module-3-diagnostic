class SearchController < ApplicationController
  def index
    render locals: {
      facade: StationsSearchFacade.new(params[:q])
    }
  end
end
