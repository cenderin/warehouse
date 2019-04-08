
Code.load_file("warehouse.exs")

ExUnit.start

defmodule WarehouseTest do
  use ExUnit.Case

  test "2,2" do
    output = Warehouse.get_position([2,2], false)
    assert output == 5
  end

  test "2,4" do
    output = Warehouse.get_position([2,4], false)
    assert output == 12
  end

  test "4,1" do
    output = Warehouse.get_position([4,1], false)
    assert output == 10
  end

  test "4,2" do
    output = Warehouse.get_position([4,2], false)
    assert output == 14
  end

  test "100000,100000" do
    # Can't get this test to pass, not sure what is wrong with the formula on the determine_position method...
    output = Warehouse.get_position([100000,100000], false)
    assert output == 20000000001
  end
end