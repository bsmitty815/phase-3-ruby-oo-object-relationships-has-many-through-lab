
class Patient

    @@all = []

    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        # returns all appointments associated with this patient
        Appointment.all.select do |appointment|
            appointment.patient == self
        end
    end

    def doctors
        #that iterates over that patient's Appointments and collects the doctor that belongs to each Appointment
        appointments.map do |appointment|
            appointment.doctor
        end
    end
end