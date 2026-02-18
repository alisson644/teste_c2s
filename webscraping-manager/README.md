# 🌐 Site Principal - Gestão de Tarefas

## 📌 Introdução

Este projeto é o **site principal** responsável pelo gerenciamento de
tarefas e integração com os demais serviços da arquitetura.

Foi desenvolvido com:

-   **Ruby 3.2.8**
-   **Rails 8.0.4**

A aplicação pode ser executada localmente ou via Docker.

------------------------------------------------------------------------

## 📚 Table of Contents

-   [Tecnologias](#-tecnologias)
-   [Instalação](#-instalação)
    -   [Execução Local](#execução-local)
    -   [Execução com Docker](#execução-com-docker)
-   [Endpoints](#-endpoints)
    -   [Atualizar Tarefa](#atualizar-tarefa)
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

A aplicação estará disponível em:

    http://localhost:8080

------------------------------------------------------------------------

### Execução com Docker

O projeto já está configurado no `compose.yml`.

Para subir o serviço:

    docker compose up

O servidor será iniciado automaticamente.

------------------------------------------------------------------------

## 📡 Endpoints

### Atualizar Tarefa

Atualiza os dados de uma tarefa existente.

**POST**\
http://localhost:8080/tasks/5

**Body:**

{ "model": "","price": "","brand": "","status": "","concluded_at":
"","task_id": "","error_message": "" }

**Resposta:**

{ "model": "qualquier", "brand": "asasda", "error_message": "123", "id":
5, "title": "novo", "url":
"https://www.webmotors.com.br/comprar/peugeot/2008/10-turbo-200-flex-active-cvt/4-portas/2024-2025/65853364?lkid=1446#VerParcelasCardRB",
"status": "pending", "concluded_at": null, "price": null, "user_mail":
"alissonhmb@gmail.com", "created_at": "2026-02-18T17:03:55.511Z",
"updated_at": "2026-02-18T17:38:17.991Z" }

------------------------------------------------------------------------

## 📦 Dependências

As principais dependências estão definidas no `Gemfile`.

Instalação:

    bundle install

------------------------------------------------------------------------

## ⚙️ Configuração

-   Configuração de banco de dados em `config/database.yml`
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

### Porta 8080 já está em uso

    lsof -i :8080
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
