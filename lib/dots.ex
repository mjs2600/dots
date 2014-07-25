defmodule Dots do
  def setup_files, do: setup_files Path.join(System.user_home, "dot_files")

  def setup_files(path) do
    file_paths = path
    |> Path.join("dot_*")
    |> Path.wildcard
    for file_path <- file_paths do
      setup_file file_path
    end
  end

  def setup_file(file_path) do
    linked_file = file_path |> updated_path
    linked_path = Path.join(System.user_home, linked_file)
    File.rm(linked_path)
    output_link_status File.ln_s(file_path, linked_path), linked_file
  end

  defp updated_path(file_path) do
    file_path
    |> Path.basename
    |> change_dot
  end

  defp change_dot("dot_" <> filename), do: "." <> filename

  defp output_link_status({:error, message}, linked_file) do
    IO.puts "Error linking #{linked_file}"
    IO.puts message
  end

  defp output_link_status(:ok, linked_file) do
    IO.puts "Linked #{linked_file}"
  end
end
