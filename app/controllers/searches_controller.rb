class SearchesController < ApplicationController
  def new
    @active = :search
  end

  def create
    @active = :search
    if params[:address].blank? && params[:zipcode].blank?
      render :json => [{:notice => "Please enter an address"}]
    else
      if !params[:address].blank?
        search = Search.new(params[:address])
      elsif !params[:zipcode].blank?
        search = Search.new(params[:zipcode])  
      end
      doctors_json = search.nearby_doctors.collect do |doctor|
        {
          :first_name => doctor.first_name,
          :last_name => doctor.last_name,
          :full_address => doctor.full_address,
          :distance => doctor.distance.round(2)
        }
      end
      render :json => doctors_json
    end
  end

end