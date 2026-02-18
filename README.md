# README

Projeto feito para rodar em docker:
* Usado Rails versão 8.0.4,  ruby 3.2.8, docker versão 4.60.1 (218372), compose versão v5.0.2
* na primeira utilização será necessário criar os bancos de dados e fazer a migração com o comando:
** docker compose run webscraping-service bundle exec rails db:create
** docker compose run webscraping-service bundle exec rails db:migrate
** docker compose run webscraping-manager bundle exec rails db:create
** docker compose run webscraping-manager bundle exec rails db:migrate
** docker compose run auth-service bundle exec rails db:create
** docker compose run auth-service bundle exec rails db:migrate
** docker compose run notification-service bundle exec rails db:create
** docker compose run notification-service bundle exec rails db:migrate

depois basta executar o comando:
docker compose up -d ; docker compose run webscraping-service bundle exec sidekiq
para subir os serviços e executar o sidekiq no servidor webcraping

As variaveis de ambiente necessária são

RAILS_MASTER_KEY
POSTGRES_PASSWORD
WEBSCRAPING_MANAGER_DATABASE_PASSWORD=
BRIGTH_DATA_KEY
BRIGHTDATA_BROWSER_PASSWORD
BRIGHT_DATA_WEBMOTORS_DATASET_ID

Foi usado um serviço de scraping para pegar as informações do webmotors
