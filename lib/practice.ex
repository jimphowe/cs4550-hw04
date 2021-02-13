defmodule Practice do
  @moduledoc """
  Practice keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def double(x) do
    2 * x
  end

  def calc(expr) do
    Practice.Calc.calc(expr)
  end

  def factorhelp(x,ac,cur) do
    cond do
      x < 2 ->
        ac ++ [x]
      cur > x / 2 -> 
        ac ++ [x]
      rem(x,cur) === 0 ->
        Practice.factorhelp(div(x, cur), ac ++ [cur], 2)
      true -> 
        Practice.factorhelp(x, ac, cur + 1)
    end
  end

  def factor(x) do
    Practice.factorhelp(x,[],2)
  end

  def palindrome(expr) do
    Practice.Palindrome.palindrome(expr)
  end
end
