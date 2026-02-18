# README

Este o site principal
* Usado Rails versão 8.0.4 e ruby 3.2.8 
* Se for executado local é necessario rodar o bundle, rails db:create, rails db:migrate
* já está configurado no compose.yml a criação do server é só rodar docker compose up que o serviço já vai subir
* requests são:
** atualizar tarefa Evento
** POST http://localhost:8080/tasks/5
** Com os parametros
{
    model:, 
    price:, 
    brand:, 
    status:, 
    concluded_at:, 
    task_id:, 
    error_message:, 
    status:
   
}

Vai retornar um json com as seguintes informaçõs:

{
    "model": "qualquier",
    "brand": "asasda",
    "error_message": "123",
    "id": 5,
    "title": "novo",
    "url": "https://www.webmotors.com.br/comprar/peugeot/2008/10-turbo-200-flex-active-cvt/4-portas/2024-2025/65853364?lkid=1446#VerParcelasCardRB",
    "status": "pending",
    "concluded_at": null,
    "price": null,
    "user_mail": "alissonhmb@gmail.com",
    "created_at": "2026-02-18T17:03:55.511Z",
    "updated_at": "2026-02-18T17:38:17.991Z"
}

Não foi realizados os testes automatizados RSPEC