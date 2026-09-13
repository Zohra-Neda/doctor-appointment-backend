class Api::DoctorsController < ApplicationController
  def index
    doctors = Doctor.includes(:category)

    render json: doctors.as_json(
      include: :category
    )
  end
end
