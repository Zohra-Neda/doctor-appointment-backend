class Api::DoctorsController < ApplicationController
  def index
    doctors = Doctor.includes(:category)

    render json: doctors.map { |doctor| doctor_response(doctor) }
  end

  def show
    doctor = Doctor.includes(:category).find(params[:id])

    render json: doctor_response(doctor)
  end

  private

  def doctor_response(doctor)
    {
      id: doctor.id,
      name: doctor.name,
      address: doctor.address,
      phone: doctor.phone,
      years_of_experience: doctor.years_of_experience,
      patients_count: doctor.patients_count,
      start_time: doctor.start_time,
      end_time: doctor.end_time,
      premium: doctor.premium,
      about: doctor.about,

      category: {
        id: doctor.category.id,
        name: doctor.category.name,
        icon: doctor.category.icon
      },

      image_url: doctor.image.attached? ? url_for(doctor.image) : nil
    }
  end
end
