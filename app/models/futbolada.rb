class Futbolada < ActiveRecord::Base
  attr_accessible :cancha_a, :cancha_b, :cancha_c, :cant_horas, :descripcion, :fecha_ingreso, :hora_inicio, :usuario_id, :status, :numero

  belongs_to :usuario

  validates :cant_horas, :presence => { :message => "La Cantidad de Horas debe estar presente" }
  validates :fecha_ingreso, :presence => { :message => "La Fecha debe estar presente" }
  validates :hora_inicio, :presence => { :message => "La Hora de Reserva debe estar presente" }
  validate :alMenos1Cancha
  validate :horasValidas?, :if => :alMenos1Cancha

  private
  def alMenos1Cancha
   errors.add(:base,"Debe elegir al menos una cancha") if (self.cancha_a.nil? && self.cancha_b.nil? && self.cancha_c.nil?)
  end

  def horasValidas?
   @lista = []
    @whereF = ""
    @whereR = ""

    if self.cancha_a
        @whereF = "cancha_a = true"
        @whereR = "tipo_cancha = 'a'"
    end

    if self.cancha_b
        if @whereF == ""
            @whereF = "#{@whereF}cancha_b = true"
            @whereR = "#{@whereR}tipo_cancha = 'b'"	    
        else
            @whereF = "#{@whereF} or cancha_b = true"
            @whereR = "#{@whereR} or tipo_cancha = 'b'"
        end
    end

    if self.cancha_c
        if @whereF == ""
            @whereF = "#{@whereF}cancha_c = true"
            @whereR = "#{@whereR}tipo_cancha = 'c'"
        else
            @whereF = "#{@whereF} or cancha_c = true"
            @whereR = "#{@whereR} or tipo_cancha = 'c'"
        end
    end

    if @whereF != ""
        @whereF = "(#{@whereF})"
        @whereR = "(#{@whereR})"
    end

    @row = Reserva.where("#{@whereR} and fecha_ingreso = '#{self.fecha_ingreso}' and hora_inicio > #{self.hora_inicio}  and hora_inicio + 1 = #{self.hora_inicio} + #{self.cant_horas}").limit(1)
    @row2 = Futbolada.where("#{@whereF} and fecha_ingreso = '#{fecha_ingreso}' and hora_inicio + 1 = #{hora} + #{self.cant_horas}").limit(1)

    if !@row.empty? || !@row2.empty?
         errors.add(:base,"Las horas elegidas ya estan reservadas")
    end
  end
end
