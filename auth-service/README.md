# README

Este serviço de autenticação do usuário
* Usado Rails versão 8.0.4 e ruby 3.2.8
* Se for executado local é necessario rodar o bundle, rails db:create, rails db:migrate
* já está configurado no compose.yml a criação do server é só rodar docker compose up que o serviço já vai subir
* requests são:
** Criar Usuário
** POST http://localhost:3000/api/v1/users 
** Com os parametros
{
    "user": {
        "name":"John Doe",
        "email": "john.doe4@example.com",
        "password": "Password1@",
        "password_confirmation": "Password1@"
    }
}

Vai retornar um json com as seguintes informaçõs:

{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3NzE0MjM2MzN9.nd4ntHJehZeNPMTqjIRUfIByUspHgPNqNSpelmZr2uo",
    "user": {
        "id": 1,
        "name": "John Doe",
        "email": "john.doe4@example.com",
        "password_digest": "$2a$12$sFzsz/TBqVPhNickxNTEF.TSBt23ZI4Kb.PCdfj7hDk/uedXE6t0a",
        "created_at": "2026-02-18T14:02:13.674Z",
        "updated_at": "2026-02-18T14:02:13.674Z",
        "refresh_token": "51579f7c0c06c102dbe6ae33c4d2fbc4eabe1a6814fec4fd15a5a967cf6a49de"

    }
}

** Buscar usuário
** GET http://localhost:3000/api/v1/users/1
** Com o HEADER:
Authorization : "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3NzE0MjM2MzN9.nd4ntHJehZeNPMTqjIRUfIByUspHgPNqNSpelmZr2uo"

** Login
** POST http://localhost:3000/api/v1/login
** Com os parametros

{
    "email": "john.doe4@example.com",
    "password": "Password1@",
}


Vai retornar as seguintes informações:

{
    "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE3NzE0MzQzOTZ9.D1xO_JJR1vMwLKOfGWiJkk3pq6WcEsBwRIkUygaYRNU",
    "refresh_token": "51579f7c0c06c102dbe6ae33c4d2fbc4eabe1a6814fec4fd15a5a967cf6a49de"
}

** Atualizar Token
** POST http://localhost:3000/api/v1/refresh_token
** Com o Parametro
{
    refresh_token: "51579f7c0c06c102dbe6ae33c4d2fbc4eabe1a6814fec4fd15a5a967cf6a49de"
}

Vai retornar a seguinte informação
{
    "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE3NzE0MzQzOTZ9.D1xO_JJR1vMwLKOfGWiJkk3pq6WcEsBwRIkUygaYRNU"
}

** Deslogar 
** DELETE http://localhost:3000/api/v1/logout
** Com o HEADER
Authorization : "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3NzE0MjM2MzN9.nd4ntHJehZeNPMTqjIRUfIByUspHgPNqNSpelmZr2uo"

Não foi realizados os testes automatizados RSPEC
