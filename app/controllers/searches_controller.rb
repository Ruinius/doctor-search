class SearchesController < ApplicationController
  def new
  end

  def create
    @doctors = Doctor.all
    render 'show'
  end
end