```elixir
list = [1, 2, 3, 4, 5]

# Solution 1: Using Enum.with_index to safely handle exit conditions
Enum.with_index(list, fn {x, i} ->
  if x == 3 do
    IO.puts("Stopping processing after element #{i + 1}")
    :ok #Return a value indicating successful conditional termination
  else
    IO.puts(x)
  end
end)

IO.puts("Processing finished.")

# Alternative Solution 2 (If process exit really needed): Handle exit in a separate process
# This avoids stopping the main process prematurely

spawn(fn ->
  Enum.each(list, fn x ->
    if x == 3 do
      Process.exit(self(), :shutdown)
    end
    IO.puts(x)
  end)
end)

IO.puts("Main process continues unaffected.")
```