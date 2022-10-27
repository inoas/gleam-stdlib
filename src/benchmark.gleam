if erlang {
  import glychee/benchmark
  import gleam/list

  pub fn main() {
    benchmark.run(
      [
        benchmark.Function(
          label: "list.flatten()",
          callable: fn(test_data) { fn() { list.flatten(test_data) } },
        ),
        benchmark.Function(
          label: "list.flatten_2()",
          callable: fn(test_data) { fn() { list.flatten_2(test_data) } },
        ),
      ],
      [
        benchmark.Data(
          label: "tiny in tiny",
          data: list.range(1, 10)
          |> list.repeat(10),
        ),
        benchmark.Data(
          label: "tiny in medium",
          data: list.range(1, 10)
          |> list.repeat(1_000),
        ),
        benchmark.Data(
          label: "medium in tiny",
          data: list.range(1, 1_000)
          |> list.repeat(10),
        ),
        benchmark.Data(
          label: "short in short",
          data: list.range(1, 100)
          |> list.repeat(100),
        ),
        benchmark.Data(
          label: "large in short",
          data: list.range(1, 10_000)
          |> list.repeat(100),
        ),
        benchmark.Data(
          label: "short in large",
          data: list.range(1, 100)
          |> list.repeat(10_000),
        ),
        benchmark.Data(
          label: "medium in medium",
          data: list.range(1, 1_000)
          |> list.repeat(1_000),
        ),
      ],
    )
  }
}
