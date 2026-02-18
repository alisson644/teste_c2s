# 🚗 Serviço de Scraping de Veículos

## 📌 Introdução

Este projeto é um serviço de **scraping de veículos**, responsável por
buscar informações diretamente do site Webmotors a partir de uma URL
fornecida.

O serviço foi desenvolvido com:

-   **Ruby 3.2.8**
-   **Rails 8.0.4**
-   Sidekiq para processamento assíncrono

A aplicação pode ser executada localmente ou via Docker.

------------------------------------------------------------------------

## 📚 Table of Contents

-   [Tecnologias](#-tecnologias)
-   [Instalação](#-instalação)
    -   [Execução Local](#execução-local)
    -   [Execução com Docker](#execução-com-docker)
-   [Processamento Assíncrono](#-processamento-assíncrono)
-   [Endpoints da API](#-endpoints-da-api)
    -   [Buscar Veículo](#buscar-veículo)
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
-   Sidekiq
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

4.  Iniciar o servidor Rails:

    rails server

5.  Iniciar o Sidekiq:

    bundle exec sidekiq

A API estará disponível em:

    http://localhost:3001

------------------------------------------------------------------------

### Execução com Docker

O projeto já está configurado no `compose.yml`.

Para subir o serviço:

    docker compose up

O servidor e os serviços necessários serão iniciados automaticamente.

------------------------------------------------------------------------

## ⚙️ Processamento Assíncrono

O serviço utiliza **Sidekiq** para processar tarefas de scraping em
background.

Ao receber a requisição, uma tarefa é criada e processada de forma
assíncrona.

------------------------------------------------------------------------

## 📡 Endpoints da API

### Buscar Veículo

Cria uma nova tarefa para buscar dados de um veículo no site Webmotors.

**POST**\
http://localhost:3001/api/v1/search_vehicle

**Body:**

{ "url":
"https://www.webmotors.com.br/comprar/peugeot/2008/10-turbo-200-flex-active-cvt/4-portas/2024-2025/65853364?lkid=1446#VerParcelasCardRB",
"user_mail": "alissonhmb@gmail.com", "task_id": 6 }

**Resposta:**

{ "status": "SUCCESS", "message": "Task create" }

------------------------------------------------------------------------

## 📦 Dependências

As principais dependências estão definidas no `Gemfile`.

Instalação:

    bundle install

------------------------------------------------------------------------

## ⚙️ Configuração

-   Configuração de banco de dados em `config/database.yml`
-   Sidekiq deve estar configurado corretamente
-   Variáveis de ambiente podem ser utilizadas
-   Docker já configurado para execução completa

------------------------------------------------------------------------

## 🧪 Testes

⚠️ Ainda não foram implementados testes automatizados com RSpec.

Recomenda-se implementar:

-   Testes de Models
-   Testes de Controllers
-   Testes de Workers (Sidekiq)
-   Testes de Requests

------------------------------------------------------------------------

## 🛠 Troubleshooting

### Porta 3001 já está em uso

    lsof -i :3001
    kill -9 <PID>

### Sidekiq não está processando

Verifique se o serviço do Redis está ativo e se o Sidekiq foi iniciado
corretamente.

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
🐳 Docker configurado\
⚙️ Processamento assíncrono com Sidekiq
