class AppointmentsController < ApplicationController
  before_action :set_service
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET services/1/appointments
  def index
    @appointments = @service.appointments
  end

  # GET services/1/appointments/1
  def show
  end

  # GET services/1/appointments/new
  def new
    @appointment = @service.appointments.build
  end

  # GET services/1/appointments/1/edit
  def edit
  end

  # POST services/1/appointments
  def create
    @appointment = @service.appointments.build(appointment_params)

    if @appointment.save
      redirect_to([@appointment.service, @appointment], notice: 'Appointment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT services/1/appointments/1
  def update
    if @appointment.update_attributes(appointment_params)
      redirect_to([@appointment.service, @appointment], notice: 'Appointment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE services/1/appointments/1
  def destroy
    @appointment.destroy

    redirect_to service_appointments_url(@service)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:service_id])
    end

    def set_appointment
      @appointment = @service.appointments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:appointment).permit(:date, :user_id)
    end
end
