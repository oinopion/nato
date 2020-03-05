defmodule Nato.TranscriberTest do
  use ExUnit.Case

  alias Nato.Transcriber

  test "code_word for a defined letter" do
    assert Transcriber.code_word("A") == "Alfa"
    assert Transcriber.code_word("Z") == "Zulu"
  end

  test "code_word for a defined lower case letter" do
    assert Transcriber.code_word("a") == "Alfa"
    assert Transcriber.code_word("z") == "Zulu"
  end

  test "code_word for an undefined letter" do
    assert Transcriber.code_word("ł") == "Ł"
    assert Transcriber.code_word("Ó") == "Ó"
  end

  test "transcribe a letter returns a one element list" do
    assert Transcriber.transcribe("A") == ["Alfa"]
  end

  test "transcrive an english word returns all code words" do
    assert Transcriber.transcribe("Apple") == [
             "Alfa",
             "Papa",
             "Papa",
             "Lima",
             "Echo"
           ]
  end

  test "transcribing a word with non-english characters" do
    assert Transcriber.transcribe("Łukasz") == [
             "Ł",
             "Uniform",
             "Kilo",
             "Alfa",
             "Sierra",
             "Zulu"
           ]
  end
end
