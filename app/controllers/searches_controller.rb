class SearchesController < ApplicationController
  def new
  end

  def create
    if !params[:address].blank?
      search = Search.new(params[:address])
    elsif !params[:zipcode].blank?
      search = Search.new(params[:zipcode])
    else
      flash[:notice] = "Please enter an address"
      redirect_to search_path and return
    end
    @doctors = search.nearby_doctors
    render 'show'
  end

end