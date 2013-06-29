Code.require_file "test_helper.exs", __DIR__

defmodule TarTest do
  use ExUnit.Case

  test "the truth" do
    file = Path.expand('../samples/sample1.tar', __FILE__)
    output = Path.expand('../samples', __FILE__)

    tar = Tar.Archive[path: file]
    Tar.extract(tar, output)

    assert(File.exists?(Path.join(output, "file.txt")))
    File.rm!(Path.join(output, "file.txt"))
  end
end