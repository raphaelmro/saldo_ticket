class Utils

  def authorize(options)
    HTTParty.post("https://api.ticket.com.br/mobile/usuarios/v3/autenticar", options)
  rescue
    puts "E-mail ou senha não conferem!"
  end

  def ticket_info(authorization, user_id)
    HTTParty.get("https://api.ticket.com.br/app/mobile/v1/usuarios/#{user_id}/cartoes/simplificados?origem=web", :headers => {
        "Content-Type" => "application/json",
        "Authorization" => authorization
    })
  rescue
    puts "Erro ao recuperar saldo."
  end
end
