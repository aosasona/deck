defmodule Note do
  @moduledoc """
  Provides method for creating and reading notes from the filesystem
  """

  @doc """
  Provides a way to create/save a note to the notes folder (on the file system). `note` is a string which represents the text you want in the note and `file_name` is a string representing the file you want to save the note in (without any extension, it is .txt by default)

  ## Examples

      iex> Note.create_note("Hello, world!", "hello")
      :ok
  """
  def create_note(note, file_name) do
    file_bin = :erlang.term_to_binary(note)
    File.write("lib/notes/#{file_name}.txt", file_bin)
  end

  @doc """
  Provides a way to read a note previously saved to the notes folder. `file_name` is a string representing the name of the file without an extension.

  ## Examples

      iex> Note.read_note("hello")
      "Hello, world!"
  """
  def read_note(file_name) do
    {status, file_bin} = File.read("lib/notes/#{file_name}.txt")

    case status do
      :ok -> :erlang.binary_to_term(file_bin)
      :error -> "Unable to read file"
    end
  end
end
