defmodule Practice.Palindrome do

  def palindromehelp(wordlist) do
    if Enum.reverse(wordlist) == wordlist do
      "true"
    else
      "false"
    end
  end

  def palindrome(word) do
    palindromehelp(String.graphemes(word))
  end
end