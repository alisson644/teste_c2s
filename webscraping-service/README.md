# README

Este o serviço de scaping 
* Usado Rails versão 8.0.4 e ruby 3.2.8 
* Se for executado local é necessario rodar o bundle, rails db:create, rails db:migrate, rodar o servidor o sidekiq bundle exec rails sidekiq
* já está configurado no compose.yml a criação do server é só rodar docker compose up que o serviço já vai subir
* requests são:
** Criar um novo veiculo buscando do site webmotors
** POST http://localhost:3001/api/v1/search_vehicle
** Com os parametros
{
    "url": "https://www.webmotors.com.br/comprar/peugeot/2008/10-turbo-200-flex-active-cvt/4-portas/2024-2025/65853364?lkid=1446#VerParcelasCardRB",
    "user_mail": "alissonhmb@gmail",
    "task_id": 6
}

Vai retornar um json com as seguintes informaçõs:

{
    "status": "SUCCESS",
    "message": "Task create"
}

Não foi realizados os testes automatizados RSPEC