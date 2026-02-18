Este serviço de notificação do usuário
* Usado Rails versão 8.0.4 e ruby 3.2.8
* Se for executado local é necessario rodar o bundle, rails db:create, rails db:migrate
* já está configurado no compose.yml a criação do server é só rodar docker compose up que o serviço já vai subir
* requests são:
** Criar Evento
** POST http://localhost:3002/api/v1/events
** Com os parametros
{
    "task_id": 24,
    "user_mail": "alissonhmb@gmail.com",
    "model": "vectra",
    "type_event": 1
}

Vai retornar um json com as seguintes informaçõs:

{
    "event": {
        "id": 31,
        "type_event": "task_completed",
        "task_id": "9",
        "user_mail": "alissonhmb@gmail.com",
        "model": "vectra",
        "brand": null,
        "price": null,
        "error_message": null,
        "created_at": "2026-02-18T18:13:00.020Z",
        "updated_at": "2026-02-18T18:13:00.020Z"
    }
}

** Buscar todos eventos do Usuario
** GET http://localhost:3002/api/v1/events
** Com o paramentro:
{
    "user_mail": "alissonhmb@gmail.com"
}

vai retornar as seguintes informações:
{
    "event": [
        {
            "id": 7,
            "type_event": "task_created",
            "task_id": "5",
            "user_mail": "alissonhmb@gmail.com",
            "model": "",
            "brand": "",
            "price": "",
            "error_message": "",
            "created_at": "2026-02-18T17:03:55.612Z",
            "updated_at": "2026-02-18T17:03:55.612Z"
        },
        {
            "id": 8,
            "type_event": "task_completed",
            "task_id": "5",
            "user_mail": "alissonhmb@gmail.com",
            "model": "2008",
            "brand": "PEUGEOT",
            "price": "118900",
            "error_message": "",
            "created_at": "2026-02-18T17:03:55.618Z",
            "updated_at": "2026-02-18T17:03:55.618Z"
        },
        {
            "id": 9,
            "type_event": "task_created",
            "task_id": "6",
            "user_mail": "alissonhmb@gmail.com",
            "model": "",
            "brand": "",
            "price": "",
            "error_message": "",
            "created_at": "2026-02-18T17:06:20.594Z",
            "updated_at": "2026-02-18T17:06:20.594Z"
        },
        {
            "id": 10,
            "type_event": "task_completed",
            "task_id": "6",
            "user_mail": "alissonhmb@gmail.com",
            "model": "2008",
            "brand": "PEUGEOT",
            "price": "118900",
            "error_message": "",
            "created_at": "2026-02-18T17:06:20.605Z",
            "updated_at": "2026-02-18T17:06:20.605Z"
        },
        {
            "id": 11,
            "type_event": "task_created",
            "task_id": "7",
            "user_mail": "alissonhmb@gmail.com",
            "model": "",
            "brand": "",
            "price": "",
            "error_message": "",
            "created_at": "2026-02-18T17:09:07.003Z",
            "updated_at": "2026-02-18T17:09:07.003Z"
        },
        {
            "id": 12,
            "type_event": "task_completed",
            "task_id": "7",
            "user_mail": "alissonhmb@gmail.com",
            "model": "2008",
            "brand": "PEUGEOT",
            "price": "118900",
            "error_message": "",
            "created_at": "2026-02-18T17:09:07.009Z",
            "updated_at": "2026-02-18T17:09:07.009Z"
        },
        {
            "id": 13,
            "type_event": "task_created",
            "task_id": "8",
            "user_mail": "alissonhmb@gmail.com",
            "model": "",
            "brand": "",
            "price": "",
            "error_message": "",
            "created_at": "2026-02-18T17:22:01.985Z",
            "updated_at": "2026-02-18T17:22:01.985Z"
        },
        {
            "id": 14,
            "type_event": "task_completed",
            "task_id": "8",
            "user_mail": "alissonhmb@gmail.com",
            "model": "2008",
            "brand": "PEUGEOT",
            "price": "118900",
            "error_message": "",
            "created_at": "2026-02-18T17:22:01.990Z",
            "updated_at": "2026-02-18T17:22:01.990Z"
        },
        {
            "id": 29,
            "type_event": "task_created",
            "task_id": "9",
            "user_mail": "alissonhmb@gmail.com",
            "model": "",
            "brand": "",
            "price": "",
            "error_message": "",
            "created_at": "2026-02-18T17:43:16.551Z",
            "updated_at": "2026-02-18T17:43:16.551Z"
        },
        {
            "id": 30,
            "type_event": "task_completed",
            "task_id": "9",
            "user_mail": "alissonhmb@gmail.com",
            "model": "TRACKER",
            "brand": "CHEVROLET",
            "price": "110000",
            "error_message": "",
            "created_at": "2026-02-18T17:44:19.310Z",
            "updated_at": "2026-02-18T17:44:19.310Z"
        },
        {
            "id": 31,
            "type_event": "task_completed",
            "task_id": "9",
            "user_mail": "alissonhmb@gmail.com",
            "model": "vectra",
            "brand": null,
            "price": null,
            "error_message": null,
            "created_at": "2026-02-18T18:13:00.020Z",
            "updated_at": "2026-02-18T18:13:00.020Z"
        }
    ]
}


Não foi realizados os testes automatizados RSPEC