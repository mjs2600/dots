defmodule Dots do
  def setup_files(path) do
    files = path
    |> Path.join("dot_*")
    |> Path.wildcard
    for file <- files do
      IO.puts file
    end
  end

  def setup_file(path) do
    File.ln_s(path, "foo")
  end
end
