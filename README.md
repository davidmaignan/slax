# Slax

```
mix format
mix ecto.create
mix phx.server
iex -S mix phx.server

iex -S mix
iex> recompile()


mix phx.routes
```

## Notes

1. Interpolation

```js
# Valid
<div id={"person-#{person.id}"} class="person">I'm a person</div>

#Invalid
<div id="person-<%= person.id %>" class="person">I'm a person</div>

```
```js
attributes = ${class: "person", title: "Persion"}
<div id="person-1" {attributes}>Person 1</div>

# output
<div id="person-1" class="person" title="Person"> ...

```

```js
<!-- new style -->
<div id={@id} class={["block mt-2 mx-auto", @class]}>
  {@user.name}
</div>
```

### Script and style tags

```html
#Must use
<script>
  window.URL="<%= @my_url %>"
</script>
```

### Control flow

```elixir
<div id="person">
  <%= if person.age >= 18 do %>
    <span>Adult</span>
  <% else %>
    <span>Child</span>
  <% end %>
</div>

```

```elixir
<span :if={person.age >= 18}>Adult</span>

# equivalent to 
<%= if person.age >= 18 do %>
  <span>Adult</span>
<% end %>

# There is no :else - Revert the condition
<div id="person">
<span :if={person.age >= 18}>Adult<span>
<span :if={person.age <> 18}>Child<span>

```

```elixir
# for iteration
<ul>
  <%= for number <- 1..10 do %>
    <li><%= number %></li>
  <% end %>
</ul>


<ul>
  <li :for={number <- 1..10>}><%= number %></li>
</ul>
```

## Ecto

```
mix phx.gen.schema Chat.Room rooms name:text topic:text
mix ecto.migrate
mix ecto.migrations
mix ecto.rollback
mix ecto.dump
```


To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
