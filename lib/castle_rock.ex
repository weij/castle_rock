defmodule CastleRock do
  @moduledoc """
  Documentation for CastleRock.
  """
  import StreamData

  def date_in_string() do
    StreamData.bind(integer(1976..9999), fn year ->
      StreamData.bind(integer(1..12), fn month ->
        StreamData.bind(integer(1..31), fn date ->
          Date.from_erl({year, month, date})
        end)
      end)
    end)
    |> StreamData.filter(fn
      {:ok, _date} -> true
      _ -> false
    end)
    |> StreamData.map(fn {:ok, date} -> Date.to_string(date) end)
  end
end
