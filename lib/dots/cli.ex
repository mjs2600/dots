defmodule Dots.CLI do
  def main([]) do
    Dots.setup_files
  end

  def main(["--help"]), do: IO.puts "Usage: dots [path]"

  def main([path]) do
    Dots.setup_files(path)
  end
end
