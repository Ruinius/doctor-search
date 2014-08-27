class SearchesController < ApplicationController
  def new
    @active = :search
  end

  def create
    @active = :search
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