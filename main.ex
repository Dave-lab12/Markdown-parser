defmodule MarkdownParser do
  def init() do
    md_dir = IO.gets("location of your MD file: ")
    output_dir = IO.gets("output HTML location: ")

    md_dir
    |> String.trim()
    |> parse_md
    |> write_to_disk(output_dir |> String.trim())
  end

  def parse_md(file_location) do
    case File.read(file_location) do
      {:ok, body} ->
        to_html(body)

      {:error, reason} ->
        IO.puts("Ops there was issue reading the file #{reason}")
        IO.puts(:file.format_error(reason))
        init()
    end
  end

  def to_html(text) do
    text
    |> p
    |> bold
    |> italics
  end

  def italics(text) do
    Regex.replace(~r/\*(.*?)\*/, text, "<em>\\1</em>")
  end

  def bold(text) do
    Regex.replace(~r/\*\*(.*?)\*\*/, text, "<strong>\\1</strong>")
  end

  def p(text) do
    Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)+$)?/, text, "<p>\\2</p>")
  end

  def write_to_disk(file, location) do
    with :ok <- File.mkdir!(Path.dirname(location)) do
      File.write(location, file)
    end
  end
end
