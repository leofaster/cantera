class ApplicationController < ActionController::Base
  protect_from_forgery
 
  def es_admin?
    return current_usuario.tipo == 'admin'
  end

  def es_ope?
    return current_usuario.tipo == 'ope'
  end

  def es_cli?
    return current_usuario.tipo == 'cli'
  end

  def consultarHorasInicio(fecha_ingreso)
    @result = []
    @lista = []
    @canchas = []
    @condicionHoras = ""
    @horas = []

    Cancha.select("id").order("id asc").each do |cancha|
	@canchas << cancha.id
    end

    @canchas.each do |c|
      (8..22).each do |i|
          if @condicionHoras != ""
	    @condicionHoras = "#{@condicionHoras} or (#{i} >= hora_ini and #{i} < hora_ini + cant_horas)"
	  else
	    @condicionHoras = "(#{i} >= hora_ini and #{i} < hora_ini)"
	  end
      end
        @canchaFutbolada = "cancha_#{c}"

        @horasResult = Reserva.joins(:reserva_canchas).where("fecha_ingreso = '#{fecha_ingreso}' and (#{@condicionHoras}) and cancha_id = #{c}").select("distinct hora_ini").order("fecha_ingreso asc")

        @horasResult.each do |hora|
	    @horas << hora.hora_ini
            
            Rails.logger.warn "anteeeeeees #{puts  hora.hora_ini}"
        end

        (8..22).each do |hora|
            Rails.logger.warn "anteeeeeees #{!@horas.include?(hora)}"
	    if !@horas.include?(hora)
            Rails.logger.warn "anteeeeeees #{hora}"
		if hora < 13
            	    @lista << ["#{hora}:00am","#{hora}"]
	        else
        	    @lista << ["#{hora-12}:00pm","#{hora}"]
          	end
	    end
        end

      @result << @lista
      @lista = []
    end

    return @result
  end

  def consultarCantidadHoras(fecha_ingreso,cancha)
    @lista = []
    @whereF = ""
    @whereR = ""

    if cancha == 'a'
        @whereF = "cancha_a = true"
        @whereR = "tipo_cancha = 'a'"
    elsif cancha == 'b'
        @whereF = "#{@whereF}cancha_b = true"
        @whereR = "#{@whereR}tipo_cancha = 'b'"	    
    elsif cancha == 'c'
        @whereF = "#{@whereF}cancha_c = true"
        @whereR = "#{@whereR}tipo_cancha = 'c'"
    end

    (1..8).each do |i|
      @row = Reserva.where("#{@whereR} and fecha_ingreso = '#{fecha_ingreso}' and hora_inicio > #{hora}  and hora_inicio + 1 = #{hora} + #{i}").limit(1)
      @row2 = Futbolada.where("#{@whereF} and fecha_ingreso = '#{fecha_ingreso}' and hora_inicio + 1 = #{hora} + #{i}").limit(1)

      if @row.empty? && @row2.empty? && (Integer(hora) + Integer(i)) <= 23
        @lista << ["#{i}","#{i}"]
      else
        break  
      end
    end

    return @lista
  end

  def consultarHorasInicioF(fecha_ingreso,cancha_a,cancha_b,cancha_c)
    @todo = []
    @lista = []
    @whereF = ""
    @whereR = ""

    if cancha_a == 'si'
        @whereF = "cancha_a = true"
        @whereR = "tipo_cancha = 'a'"
    end

    if cancha_b == 'si'
        if @whereF == ""
            @whereF = "#{@whereF}cancha_b = true"
            @whereR = "#{@whereR}tipo_cancha = 'b'"	    
        else
            @whereF = "#{@whereF} or cancha_b = true"
            @whereR = "#{@whereR} or tipo_cancha = 'b'"
        end
    end

    if cancha_c == 'si'
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

    (8..22).each do |i|
      @row = Reserva.where("#{@whereR} and fecha_ingreso = '#{fecha_ingreso}' and #{i} >= hora_inicio && #{i} < hora_inicio + cant_horas").limit(1)
      @row2 = Futbolada.where("#{@whereF} and fecha_ingreso = '#{fecha_ingreso}' and #{i} >= hora_inicio && #{i} < hora_inicio + cant_horas").limit(1)

      if @row.empty? && @row2.empty?
        if i < 13
          @lista << ["#{i}:00am","#{i}"]
        else
          @lista << ["#{i-12}:00pm","#{i}"]
        end
      end
    end

    @todo << @lista

    if !@lista.empty?
      @todo << consultarCantidadHorasF(fecha_ingreso,@lista[0][1],cancha_a,cancha_b,cancha_c)
    end

    return @todo
  end

  def consultarCantidadHorasF(fecha_ingreso,hora,cancha_a,cancha_b,cancha_c)
    @lista = []
    @whereF = ""
    @whereR = ""

    if cancha_a == 'si'
        @whereF = "cancha_a = true"
        @whereR = "tipo_cancha = 'a'"
    end

    if cancha_b == 'si'
        if @whereF == ""
            @whereF = "#{@whereF}cancha_b = true"
            @whereR = "#{@whereR}tipo_cancha = 'b'"	    
        else
            @whereF = "#{@whereF} or cancha_b = true"
            @whereR = "#{@whereR} or tipo_cancha = 'b'"
        end
    end

    if cancha_c == 'si'
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

    (1..8).each do |i|
      @row = Reserva.where("#{@whereR} and fecha_ingreso = '#{fecha_ingreso}' and hora_inicio > #{hora}  and hora_inicio + 1 = #{hora} + #{i}").limit(1)
      @row2 = Futbolada.where("#{@whereF} and fecha_ingreso = '#{fecha_ingreso}' and hora_inicio + 1 = #{hora} + #{i}").limit(1)

      if @row.empty? && @row2.empty? && (Integer(hora) + Integer(i)) <= 23
        @lista << ["#{i}","#{i}"]
      else
        break  
      end
    end

    return @lista
  end
end
