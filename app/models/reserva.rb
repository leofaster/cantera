class Reserva < ActiveRecord::Base
  attr_accessible :fecha_ingreso, :usuario_id, :status

  belongs_to :usuario
  has_many :reserva_canchas, :dependent => :destroy
  has_many :canchas, :through => :reserva_canchas

  accepts_nested_attributes_for :reserva_canchas

  validates :fecha_ingreso, :presence => { :message => "La Fecha debe estar presente" }
  #validate :unicidad, :if => :algunaCancha?
=begin
  private
  def unicidad
    query = "tipo_cancha = '#{self.tipo_cancha}' and fecha_ingreso = '#{self.fecha_ingreso}' and ((#{self.hora_inicio} < hora_inicio and #{self.hora_inicio} + #{self.cant_horas} > hora_inicio)"
    query = "#{query} or (#{self.hora_inicio} = hora_inicio) or (#{self.hora_inicio} > hora_inicio and #{self.hora_inicio} < hora_inicio + cant_horas))"

   if self.id.nil?
     @fechaHora = Reserva.where(query)
   else
     @fechaHora = Reserva.where("id != #{self.id} and #{query}")
   end
   
   errors.add(:base,"La cancha fue reservada a las #{@fechaHora.first.hora_inicio} hasta #{@fechaHora.first.hora_inicio+@fechaHora.first.cant_horas}") if (!@fechaHora.empty?)
  end

  def algunaCancha?
    return !fecha_ingreso.nil? && ((!hora_inicio.nil? && !cant_horas.nil?) || (!hora_inicio_b.nil? && !cant_horas_b.nil?) || (!hora_inicio_c.nil? && !cant_horas_c.nil?))
  end
=end
end
