defmodule ComeBite.Crawler do
  def fetch_XCF_menu(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body}} ->
        parse_menu(body)

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason, label: "Request failed")
        []
    end
  end

  defp parse_menu(html) do
    # found_elements = Floki.find(html, ".ing-name")
    # IO.inspect(found_elements, label: "Floki.find result")
    # {tag_name, attributes, children}
    # [
    #   {"div", [{"class", "ing-name"}, {"data-v-05b2c2f4", "data-v-05b2c2f4"}], ["\n              西红柿\n            "]}
    #   ...
    # ]

    Floki.find(html, ".ing-name")
    # Iterates through the list of tuples and extracts only the text content
    # &Floki.text/1 === fn x -> Floki.text(x) end
    |> Enum.map(&Floki.text/1)
    |> Enum.map(&String.trim/1)
  end
end
