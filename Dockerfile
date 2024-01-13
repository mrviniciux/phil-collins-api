# imagem base
# Alpine é uma imagem mínima do Docker baseada no Alpine Linux com um índice de pacotes completo e apenas 5 MB de tamanho!
FROM elixir:latest

WORKDIR /app

# instalando o gerenciar de pacotes do elixir
RUN mix local.hex --force && \
    mix local.rebar --force

# também funciona essa sintaxe:
# RUN mix do local.hex --force, local.rebar --force

# copiar tudo da raiz do projeto para o contêiner docker
COPY . .

# instalar as dependencias
RUN mix do deps.get, deps.compile, phx.digest

# executar o servidor
CMD ["/app/entrypoint.sh"]