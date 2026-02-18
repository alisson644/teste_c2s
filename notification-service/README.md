# 🔔 Serviço de Notificação de Usuário

## 📌 Introdução

Este projeto é um serviço de notificação de eventos do usuário
desenvolvido com **Ruby 3.2.8** e **Rails 8.0.4**.

A API permite:

-   Criar eventos relacionados a tarefas
-   Consultar todos os eventos de um usuário
-   Registrar diferentes tipos de eventos (ex: task_created,
    task_completed)

O serviço pode ser executado localmente ou via Docker.

------------------------------------------------------------------------

## 📚 Table of Contents

-   [Tecnologias](#-tecnologias)
-   [Instalação](#-instalação)
    -   [Execução Local](#execução-local)
    -   [Execução com Docker](#execução-com-docker)
-   [Endpoints da API](#-endpoints-da-api)
    -   [Criar Evento](#criar-evento)
    -   [Buscar Eventos do Usuário](#buscar-eventos-do-usuário)
-   [Estrutura do Evento](#-estrutura-do-evento)
-   [Dependências](#-dependências)
-   [Configuração](#-configuração)
-   [Testes](#-testes)
-   [Troubleshooting](#-troubleshooting)
-   [Contribuidores](#-contribuidores)
-   [Licença](#-licença)

------------------------------------------------------------------------

## 🚀 Tecnologias

-   Ruby 3.2.8
-   Rails 8.0.4
-   Docker
-   Docker Compose

------------------------------------------------------------------------

## 🛠 Instalação

### Execução Local

1.  Instalar dependências:

    bundle install

2.  Criar o banco de dados:

    rails db:create

3.  Executar as migrations:

    rails db:migrate

4.  Iniciar o servidor:

    rails server

A API estará disponível em:

    http://localhost:3002

------------------------------------------------------------------------

### Execução com Docker

O projeto já está configurado no `compose.yml`.

Para subir o serviço:

    docker compose up

O servidor será iniciado automaticamente.

------------------------------------------------------------------------

## 📡 Endpoints da API

### Criar Evento

POST\
http://localhost:3002/api/v1/events

Body:

{ "task_id": 24, "user_mail": "alissonhmb@gmail.com", "model": "vectra",
"type_event": 1 }

Resposta:

{ "event": { "id": 31, "type_event": "task_completed", "task_id": "9",
"user_mail": "alissonhmb@gmail.com", "model": "vectra", "brand": null,
"price": null, "error_message": null, "created_at":
"2026-02-18T18:13:00.020Z", "updated_at": "2026-02-18T18:13:00.020Z" } }

------------------------------------------------------------------------

### Buscar Eventos do Usuário

GET\
http://localhost:3002/api/v1/events

Parâmetro:

{ "user_mail": "alissonhmb@gmail.com" }

Resposta:

{ "event": \[ { "id": 7, "type_event": "task_created", "task_id": "5",
"user_mail": "alissonhmb@gmail.com", "model": "","brand": "","price":
"","error_message": "","created_at": "2026-02-18T17:03:55.612Z",
"updated_at": "2026-02-18T17:03:55.612Z" } \] }

------------------------------------------------------------------------

## 📦 Estrutura do Evento

Campos possíveis:

-   id
-   type_event (task_created, task_completed, etc)
-   task_id
-   user_mail
-   model
-   brand
-   price
-   error_message
-   created_at
-   updated_at

------------------------------------------------------------------------

## 📦 Dependências

As principais dependências estão definidas no `Gemfile`.

Instalação:

    bundle install

------------------------------------------------------------------------

## ⚙️ Configuração

-   Configurações de banco estão em `config/database.yml`
-   Variáveis de ambiente podem ser utilizadas
-   Docker já configurado para execução

------------------------------------------------------------------------

## 🧪 Testes

⚠️ Ainda não foram implementados testes automatizados com RSpec.

Recomenda-se implementar:

-   Testes de Models
-   Testes de Controllers
-   Testes de Requests

------------------------------------------------------------------------

## 🛠 Troubleshooting

### Porta 3002 já está em uso

    lsof -i :3002
    kill -9 <PID>

### Erro ao rodar migrations

Verifique se o banco de dados está ativo.

------------------------------------------------------------------------

## 👥 Contribuidores

-   Desenvolvedor responsável pelo projeto Alisson Henrique Morais Braz

------------------------------------------------------------------------

## 📄 Licença

Este projeto não possui licença definida.

------------------------------------------------------------------------

# ✅ Status do Projeto

🚧 Em desenvolvimento\
🧪 Testes automatizados pendentes\
🐳 Docker configurado
