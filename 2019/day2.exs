1,0,0,0,99
[1,0,0,0,99]
take first value 1 read_opcode
take next 2 values

defmodule Part1 do
  def intcode(input) do
    input
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> IO.inspect(label: "input")
      |> run_program
  end

  defp run_program(code) do
      Enum.chunk_every(code, 4)
      |> Enum.map(fun)
      inst = read_instructions(code)
      case read_opcode(inst) do
      1 ->
        # add
        System.halt(1)
      2 ->
        # multiply
        System.halt(1)
      99 ->
        code
      _ ->
        IO.puts(:stderr, "oops, this shouldn't happen! Bad input.")
      System.halt(1)
      end
  end

  defp read_instructions(codes) when is_list(codes) do
    Enum.take(codes, 4)
  end

  defp read_opcode([op | _]) do
    op
  end
end

case System.argv() do
  ["--test1"] ->
    ExUnit.start()

    defmodule Part1Test do
      use ExUnit.Case

      import Part1

      test "opcode" do
        assert fuel_counter_upper("1,0,0,0,99") == "2,0,0,0,99"
      end
    end

  [input_file] ->
    input_file
    |> File.read!()
    |> Part1.fuel_counter_upper()
    |> IO.puts()

  _ ->
    IO.puts(:stderr, "expected --test or an input file")
    System.halt(1)
end
