FROM elixir:latest

# envs
ENV MIX_ENV=prod \
    APP_NAME=phil_collins_api

# configurar diretório de trabalho
WORKDIR /app

# dependências
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Copiar todo o código
COPY . .

# Compilar
RUN mix do compile, phx.digest

# Expor a porta que o Phoenix vai rodar
EXPOSE 4000

# Comando para iniciar o aplicativo
CMD ["mix", "phx.server"]
