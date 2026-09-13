class Api::DoctorsController < ApplicationController
  def index
    doctors = Doctor.includes(:category)

    render json: doctors.map { |doctor|
      doctor.as_json(
        include: :category
      ).merge(
        image_url: doctor.image.attached? ? url_for(doctor.image) : nil
      )
    }
  end
end
