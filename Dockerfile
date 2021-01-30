FROM bitwalker/alpine-elixir-phoenix:latest

# Set mix env and ports
ENV MIX_ENV=prod

# Cache Elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Cache JS deps
# Note: This depends on `phoenix` elixir package
ADD assets/package.json assets/
RUN npm --prefix ./assets install

# Run frontend build
ADD assets assets
RUN npm --prefix ./assets run deploy

ADD . .

# Run compile, and digest assets
# TODO: Get rid of SECRET_KEY_BASE here - the build errors without it
RUN SECRET_KEY_BASE='this-should-matter-during-build' mix do compile, phx.digest

CMD ["mix", "phx.server"]
