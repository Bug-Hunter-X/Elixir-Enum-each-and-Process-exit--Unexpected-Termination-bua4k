```elixir
list = [1, 2, 3, 4, 5]

Enum.each(list, fn x ->
  if x == 3 do
    Process.exit(self(), :shutdown)
  end
  IO.puts(x)
end)
```