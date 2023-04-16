defmodule Note do
  def create_note(note, file_name) do
    file_bin = :erlang.term_to_binary(note)
    File.write("lib/notes/#{file_name}.txt", file_bin)
  end

  def load_note(file_name) do
    {status, file_bin} = File.read("lib/notes/#{file_name}.txt")

    case status do
      :ok -> :erlang.binary_to_term(file_bin)
      :error -> "Unable to read file"
    end
  end
end
