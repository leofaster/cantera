module ApplicationHelper
  def es_admin?
    return current_usuario.tipo == 'admin'
  end

  def es_ope?
    return current_usuario.tipo == 'ope'
  end

  def es_cli?
    return current_usuario.tipo == 'cli'
  end
end
