class SearchesController < ApplicationController
  def new
    @active = :search
  end

  def create
    @active = :search
    if params[:address].blank? && params[:zipcode].blank?
      render :json => [{:notice => "Please enter an address"}]
    else
      render :json => doctors_json
    end
  end

  private
  def search_params
    params.permit(:address,:zipcode).merge(params.require(:specialty).permit(:id))
  end

  def doctors_json()
    search = Search.new(search_params)
    search.nearby_doctors.collect do |doctor|
      {
        :first_name => doctor.first_name,
        :last_name => doctor.last_name,
        :full_address => doctor.full_address,
        :distance => doctor.distance.round(2),
        :specialties => doctor.specialty_list
      }
    end
  end

end