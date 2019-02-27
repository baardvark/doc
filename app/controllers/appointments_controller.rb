class AppointmentsController < ApplicationController
  before_action :set_doctor

  def index
    @physicians = @doctor.appointments.where(role: 'physician')
    @nurses = @doctor.appointments.where(role: 'nurse')
    @patients = @doctor.appointments.where(role: 'patient')
  end

  def new
    @users = User.all - @doctor.users
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path
    else
      render :new
    end
  end

  def destroy
    appointment = @doctor.appointments.find(params[:id])
    appointment.destroy
    redirect_to doctor_users_path
  end

 private
   def set_doctor
     @doctor = Doctor.find(params[:doctor_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:role, :user_id)
   end

end
