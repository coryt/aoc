defmodule Part1 do
  def fuel_counter_upper(input) do
    input
    |> String.split("\n", trim: true)
    |> IO.inspect(label: "input")
    |> Enum.map(&calc_module_fuel/1)
    |> IO.inspect(label: "fuel")
    |> Enum.sum()
    |> IO.inspect(label: "total")
  end

  defp calc_module_fuel(mass) when is_integer(mass) do
    (mass / 3)
    |> floor
    |> (&(&1 - 2)).()
  end

  defp calc_module_fuel(mass) do
    mass
    |> String.to_integer()
    |> (&(&1 / 3)).()
    |> floor
    |> (&(&1 - 2)).()
  end
end

defmodule Part2 do
  def fuel_calc(input) do
    input
    |> String.split("\n", trim: true)
    |> IO.inspect(label: "input")
    |> Enum.map(&calc_module_fuel/1)
    |> IO.inspect(label: "fuel")
    |> Enum.sum()
    |> IO.inspect(label: "total")
  end

  defp calc_module_fuel(mass) when is_integer(mass) do
    (mass / 3)
    |> floor
    |> (&(&1 - 2)).()
  end

  defp calc_module_fuel(mass) do
    mass
    |> String.to_integer()
    |> (&(&1 / 3)).()
    |> floor
    |> (&(&1 - 2)).()
  end
end

case System.argv() do
  ["--test1"] ->
    ExUnit.start()

    defmodule Part1Test do
      use ExUnit.Case

      import Part1

      test "fuel_counter_upper" do
        assert fuel_counter_upper("""
               12
               14
               1969
               100756
               """) == 34241
      end
    end

  ["--test2"] ->
    ExUnit.start()

    defmodule Part2Test do
      use ExUnit.Case

      import Part2

      test "fuel_counter_upper" do
        assert fuel_counter_upper("""
               12
               14
               1969
               100756
               """) == 34241
      end
    end

  [input_file] ->
    input_file
    |> File.read!
    # |> Part1.fuel_counter_upper()
    |> Part2.fuel_calc
    |> IO.puts

  _ ->
    IO.puts(:stderr, "expected --test or an input file")
    System.halt(1)
end
