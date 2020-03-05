defmodule Nato.Transcriber do
  @code_words %{
    "A" => "Alfa",
    "B" => "Bravo",
    "C" => "Charlie",
    "D" => "Delta",
    "E" => "Echo",
    "F" => "Foxtrot",
    "G" => "Golf",
    "H" => "Hotel",
    "I" => "India",
    "J" => "Juliett",
    "K" => "Kilo",
    "L" => "Lima",
    "M" => "Mike",
    "N" => "November",
    "O" => "Oscar",
    "P" => "Papa",
    "Q" => "Quebec",
    "R" => "Romeo",
    "S" => "Sierra",
    "T" => "Tango",
    "U" => "Uniform",
    "V" => "Victor",
    "W" => "Whiskey",
    "X" => "X",
    "Y" => "Yankee",
    "Z" => "Zulu",
    " " => " "
  }

  @spec transcribe(String.t()) :: [String.t()]
  def transcribe(phrase) do
    phrase
    |> String.codepoints()
    |> Enum.map(&code_word/1)
  end

  @spec code_word(String.t()) :: String.t()
  def code_word(letter) do
    upcased_letter = String.upcase(letter)
    Map.get(@code_words, upcased_letter, upcased_letter)
  end
end
