# Chat

Para correr el proyecto se debe ir a la raiz del proyecto y ejecutar:

```
mix compile
```
Luego ejecutar el siguiente comando para entrar a una terminal de elixir:
```
iex -S mix
```
Para empezar a probar el código, se debe crear un chatroom con n usuarios. "n" se debe cambiar por el número deseado de ususarios.
``` elixir
Chat.start_chat(n)
```
Para añadir un usuario:
``` elixir
# user_id puede ser un numero o un nombre. Recordar que si se quiere poner un nombre se debe poner entre comillas
Chat.add_user("Isabela")
Chat.add_user(6)
```
Para enviar un mensaje se pone el usuario y el mensaje que se quiere enviar:
``` elixir
Chat.write_message("Isabela", "Holaa")
Chat.write_message(3, "Holaaa")
```
## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `chat` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chat, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/chat>.

