defmodule FizzBuzzElixirClient do
  @moduledoc """
  Documentation for `FizzBuzzElixirClient`.
  """

  def main(args) do
    Application.ensure_all_started(:inets)
    Application.ensure_all_started(:ssl)

    options = [switches: [page: :integer, size: :integer]]

    {opts, _, _} = OptionParser.parse(args, options)

#    IO.inspect(opts)
    get_page(opts[:page], opts[:size])
  end

  @doc """
  Hello world.

  ## Examples

      iex> FizzBuzzElixirClient.hello()
      :world

  """
  def get_page(page, size) do
    IO.puts(page)
    IO.puts(size)
    url = 'http://localhost:8080/getPage?'

    url = unless page == nil do
      url ++ 'pageNum=' ++ to_charlist(page) ++ '&'
    end

    url = unless size == nil do
      url ++ 'pageSize=' ++ to_charlist(size)
    end

    {:ok, {{'HTTP/1.1', 200, _}, _, json}} = :httpc.request(:get, {url, []}, [], [])
    IO.puts(json)
  end
end
