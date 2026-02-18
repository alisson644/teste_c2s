# 🏗️ WebScraping Platform - Arquitetura Completa em Microserviços

## 📌 Visão Geral

Este projeto consiste em uma arquitetura baseada em **microserviços**,
desenvolvida com:

-   Ruby 3.2.8
-   Rails 8.0.4
-   Docker 4.60.1 (218372)
-   Docker Compose v5.0.2
-   Sidekiq (processamento assíncrono)

A plataforma é composta por quatro serviços principais:

1.  🔐 Auth Service -- Serviço de autenticação (JWT)
2.  🔔 Notification Service -- Serviço de eventos e notificações
3.  🚗 WebScraping Service -- Serviço de scraping de veículos
4.  🌐 WebScraping Manager (Site Principal) -- Gestão de tarefas

Todos os serviços são executados via Docker.

------------------------------------------------------------------------

# 🐳 Execução do Projeto

## 📦 Primeira execução (obrigatório)

Criar os bancos de dados e executar as migrations:

docker compose run webscraping-service bundle exec rails db:create\
docker compose run webscraping-service bundle exec rails db:migrate

docker compose run webscraping-manager bundle exec rails db:create\
docker compose run webscraping-manager bundle exec rails db:migrate

docker compose run auth-service bundle exec rails db:create\
docker compose run auth-service bundle exec rails db:migrate

docker compose run notification-service bundle exec rails db:create\
docker compose run notification-service bundle exec rails db:migrate

------------------------------------------------------------------------

## 🚀 Subindo os serviços

docker compose up -d\
docker compose run webscraping-service bundle exec sidekiq

Isso irá:

-   Subir todos os serviços
-   Executar o Sidekiq no webscraping-service

------------------------------------------------------------------------

# 🔐 Variáveis de Ambiente

As seguintes variáveis são obrigatórias:

RAILS_MASTER_KEY\
POSTGRES_PASSWORD\
WEBSCRAPING_MANAGER_DATABASE_PASSWORD\
BRIGTH_DATA_KEY\
BRIGHTDATA_BROWSER_PASSWORD\
BRIGHT_DATA_WEBMOTORS_DATASET_ID

------------------------------------------------------------------------

# 🧩 Serviços da Plataforma

## 🔐 1. Auth Service (Porta 3000)

Responsável por:

-   Cadastro de usuários
-   Login
-   Geração de Access Token (JWT)
-   Refresh Token
-   Logout

Endpoints principais:

POST /api/v1/users\
POST /api/v1/login\
POST /api/v1/refresh_token\
DELETE /api/v1/logout

Autenticação via JWT no header Authorization.

------------------------------------------------------------------------

## 🔔 2. Notification Service (Porta 3002)

Responsável por:

-   Registrar eventos das tarefas
-   Consultar eventos por usuário

Endpoint principal:

POST /api/v1/events\
GET /api/v1/events?user_mail=email

Eventos suportados:

-   task_created
-   task_completed
-   outros eventos relacionados à execução das tarefas

------------------------------------------------------------------------

## 🚗 3. WebScraping Service (Porta 3001)

Responsável por:

-   Buscar dados de veículos no site Webmotors
-   Executar scraping via serviço externo (Bright Data)
-   Processar tarefas de forma assíncrona via Sidekiq

Endpoint principal:

POST /api/v1/search_vehicle

Body esperado:

{ "url": "URL do veículo no Webmotors", "user_mail": "email do usuário",
"task_id": 6 }

Resposta:

{ "status": "SUCCESS", "message": "Task create" }

------------------------------------------------------------------------

## 🌐 4. WebScraping Manager (Porta 8080)

Site principal responsável por:

-   Criar e gerenciar tarefas
-   Atualizar status da tarefa
-   Integrar com os demais serviços

Endpoint principal:

POST /tasks/:id

Permite atualizar:

-   model
-   brand
-   price
-   status
-   concluded_at
-   error_message

------------------------------------------------------------------------

# 🔄 Fluxo da Arquitetura

1.  Usuário se autentica no Auth Service.
2.  Usuário cria uma tarefa no WebScraping Manager.
3.  WebScraping Service realiza o scraping de forma assíncrona.
4.  Notification Service registra os eventos da tarefa.
5.  WebScraping Manager atualiza a tarefa com os dados coletados.

------------------------------------------------------------------------

# 🧠 Serviço de Scraping

O projeto utiliza um serviço externo de scraping (Bright Data) para
capturar informações do site Webmotors.

------------------------------------------------------------------------

# 🧪 Testes

⚠️ Nenhum dos serviços possui testes automatizados com RSpec
implementados até o momento.

Recomendado implementar:

-   Testes de Model
-   Testes de Controller
-   Testes de Request
-   Testes de Workers (Sidekiq)
-   Testes de integração entre serviços

------------------------------------------------------------------------

# 📌 Status do Projeto

🚧 Em desenvolvimento\
🧪 Testes automatizados pendentes\
🐳 100% containerizado com Docker\
⚙️ Arquitetura baseada em microserviços\
🔐 Autenticação JWT implementada\
🚗 Scraping automatizado via Bright Data

------------------------------------------------------------------------

# 📄 Licença

Este projeto não possui licença definida.
