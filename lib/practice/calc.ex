defmodule Practice.Calc do
  def doop(val1,op,val2) do
    cond do
      op === "+" ->
        Float.to_string(elem(Float.parse(val1),0) + elem(Float.parse(val2),0))
      op === "-" ->
        Float.to_string(elem(Float.parse(val1),0) - elem(Float.parse(val2),0))
      op === "*" ->
        Float.to_string(elem(Float.parse(val1),0) * elem(Float.parse(val2),0))
      op === "/" ->
        Float.to_string(elem(Float.parse(val1),0) / elem(Float.parse(val2),0))
    end
  end

  def calchelp(expr,curval,curop) do
    cond do
      expr == [] ->
        curval
      Regex.match?(~r/^\d+$/, hd(expr)) ->
        if curval === "" do
          calchelp(tl(expr),hd(expr),curop)
        else
          calchelp(tl(expr),doop(curval,curop,hd(expr)),curop)
        end
      #operation case
      true ->
        calchelp(tl(expr),curval, hd(expr))
    end
  end

  def betterlist(exprlist, curval, result) do
    cond do
      exprlist == [] ->
        result ++ [curval]
      hd(exprlist) === " " ->
        betterlist(tl(exprlist), curval, result)
      Regex.match?(~r/^\d+$/, hd(exprlist)) ->
        betterlist(tl(exprlist),curval <> hd(exprlist), result)
      # operation case
      true ->
        betterlist(tl(exprlist), "", result ++ [curval, hd(exprlist)])
    end
  end
    
  def calc(expr) do
    elem(Float.parse(calchelp(betterlist(String.graphemes(expr),"",[]), "", "")),0)
  end
end

