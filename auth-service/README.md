# 🔐 Serviço de Autenticação de Usuário

## 📌 Introdução

Este projeto é um serviço de autenticação de usuários desenvolvido com
**Ruby 3.2.8** e **Rails 8.0.4**. A API fornece funcionalidades
completas de autenticação utilizando **JWT (JSON Web Token)** com
suporte a:

-   Criação de usuário
-   Login
-   Geração de Access Token
-   Refresh Token
-   Logout
-   Busca de usuário autenticado

O projeto está preparado para execução local ou via Docker.

------------------------------------------------------------------------

## 📚 Table of Contents

-   [Tecnologias](#-tecnologias)
-   [Instalação](#-instalação)
    -   [Execução Local](#execução-local)
    -   [Execução com Docker](#execução-com-docker)
-   [Endpoints da API](#-endpoints-da-api)
    -   [Criar Usuário](#criar-usuário)
    -   [Buscar Usuário](#buscar-usuário)
    -   [Login](#login)
    -   [Atualizar Token](#atualizar-token)
    -   [Logout](#logout)
-   [Autenticação](#-autenticação)
-   [Estrutura de Tokens](#-estrutura-de-tokens)
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
-   JWT
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

    http://localhost:3000

------------------------------------------------------------------------

### Execução com Docker

O projeto já está configurado no `compose.yml`.

Para subir o serviço:

    docker compose up

O servidor será iniciado automaticamente.

------------------------------------------------------------------------

## 📡 Endpoints da API

### Criar Usuário

POST\
http://localhost:3000/api/v1/users

Body:

{ "user": { "name": "John Doe", "email": "john.doe4@example.com",
"password": "Password1@", "password_confirmation": "Password1@" } }

Resposta:

{ "token": "JWT_TOKEN", "user": { "id": 1, "name": "John Doe", "email":
"john.doe4@example.com", "password_digest": "...", "created_at":
"2026-02-18T14:02:13.674Z", "updated_at": "2026-02-18T14:02:13.674Z",
"refresh_token": "REFRESH_TOKEN" } }

------------------------------------------------------------------------

### Buscar Usuário

GET\
http://localhost:3000/api/v1/users/1

Header:

Authorization: JWT_TOKEN

------------------------------------------------------------------------

### Login

POST\
http://localhost:3000/api/v1/login

Body:

{ "email": "john.doe4@example.com", "password": "Password1@" }

Resposta:

{ "access_token": "ACCESS_TOKEN", "refresh_token": "REFRESH_TOKEN" }

------------------------------------------------------------------------

### Atualizar Token

POST\
http://localhost:3000/api/v1/refresh_token

Body:

{ "refresh_token": "REFRESH_TOKEN" }

Resposta:

{ "access_token": "NEW_ACCESS_TOKEN" }

------------------------------------------------------------------------

### Logout

DELETE\
http://localhost:3000/api/v1/logout

Header:

Authorization: JWT_TOKEN

------------------------------------------------------------------------

## 🔐 Autenticação

A autenticação é feita via **JWT**.

-   O `access_token` deve ser enviado no header `Authorization`
-   O `refresh_token` é utilizado para gerar um novo `access_token`
-   Tokens possuem tempo de expiração (`exp`)

------------------------------------------------------------------------

## 📦 Dependências

As principais dependências estão definidas no `Gemfile`.

Instalação:

    bundle install

------------------------------------------------------------------------

## ⚙️ Configuração

-   Configurações de banco estão em `config/database.yml`
-   Configurações de ambiente podem ser definidas via variáveis de
    ambiente
-   Docker já possui configuração pronta para execução

------------------------------------------------------------------------

## 🧪 Testes

⚠️ Ainda não foram implementados testes automatizados com RSpec.

Recomenda-se a implementação de testes para:

-   Models
-   Controllers
-   Requests
-   Fluxo completo de autenticação

------------------------------------------------------------------------

## 🛠 Troubleshooting

### Porta 3000 já está em uso

    lsof -i :3000
    kill -9 <PID>

### Erro ao rodar migrations

Verifique se o banco de dados está rodando corretamente.

------------------------------------------------------------------------

## 👥 Contribuidores

-   Desenvolvedor responsável pelo projeto Álisson Henrique

------------------------------------------------------------------------

## 📄 Licença

Este projeto não possui licença definida.

------------------------------------------------------------------------

# ✅ Status do Projeto

🚧 Em desenvolvimento\
🧪 Testes automatizados pendentes\
🔐 Autenticação JWT implementada\
🐳 Docker configurado
