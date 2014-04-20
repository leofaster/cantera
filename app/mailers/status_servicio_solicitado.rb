class StatusServicioSolicitado < ActionMailer::Base
  default from: "La Cantera Futsal <noreply@lacanterafutsal.com>"

  def servicio_email(user,servicio)
    @user = user
    @servicio = servicio
    @url  = "http://lacanterafutsal.com/gestion"
    subject = @servicio.class.name == 'Futbolada' ? 'Estatus de su Futbolada' : 'Estatus de su Reserva'
    mail(:to => user.email, :subject => subject)
  end

  def contactanos_email(nombre,apellido,telefono,email,comentarios_sugerencias)
  	@nombre = nombre
  	@apellido = apellido
  	@telefono = telefono
  	@email = email
  	@comentarios_sugerencias = comentarios_sugerencias
  	subject = 'Nos contacto #{@nombre} #{@apellido}'
  	mail(:to => 'nemm333@gmail.com', :subject => subject)
  end
end
