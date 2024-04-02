# Markdown Parser
This is a very simple Elixir module named ``MarkdownParser`` that converts Markdown text to HTML.

### Usage
To use this module, call the ``init()`` function. It will prompt you for the location of your Markdown file and the desired output location for the HTML file.

```elixir
MarkdownParser.init()
```
### Functions
* ```init()```: Prompts the user for the input and output file locations, reads the Markdown file, converts it to HTML, and writes the HTML to the output file.

* ```parse_md(file_location)```: Reads the file at file_location, converts its contents to HTML, and handles any file reading errors.

* ```to_html(text)```: Converts the given Markdown text to HTML.

* ```italics(text)```: Converts any text in text surrounded by single asterisks to HTML italics.

* ```bold(text)```: Converts any text in text surrounded by double asterisks to HTML bold.
  
* ```h1(text)```: Converts any text in a text prefixed by '#' into HTML h1 tags.
  
* ```h2(text)```: Converts any text in a text prefixed by '##' into HTML h2tags.

* ```h3(text)```: Converts any text in a text that is prefixed by '###' into HTML h3 tags.

* ```p(text)```: Wraps any text in text separated by newlines in HTML paragraph tags.

* ```write_to_disk(file, location)```: Writes file to a location, creating any necessary directories.

### Error Handling
If there's an issue reading the file in parse_md(file_location), it will print an error message and call init() again to prompt for a new file location.
