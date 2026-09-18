class Api::AppointmentsController < ApplicationController
  def index
    appointments = Appointment.includes(:doctor, :user)

    render json: appointments.map { |appointment| appointment_response(appointment) }
  end

  def create
    appointment = Appointment.new(appointment_params)

    if appointment.save
      render json: appointment_response(appointment), status: :created
    else
      render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy

    render json: { message: "Appointment deleted successfully" }
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :date,
      :time,
      :note,
      :doctor_id,
      :user_id
    )
  end

  def appointment_response(appointment)
    {
      id: appointment.id,
      date: appointment.date,
      time: appointment.time,
      note: appointment.note,

      doctor: {
        id: appointment.doctor.id,
        name: appointment.doctor.name,
        address: appointment.doctor.address,
        phone: appointment.doctor.phone,
        image_url: appointment.doctor.image.attached? ? url_for(appointment.doctor.image) : nil
      },

      user: {
        id: appointment.user.id,
        email: appointment.user.email,
        first_name: appointment.user.first_name,
        last_name: appointment.user.last_name
      }
    }
  end
end
