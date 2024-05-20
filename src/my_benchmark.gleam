import gleam/int
import gleam/list
import gleam/list_pre_pr
import gleam/list_sort_erlang
import glychee/benchmark
import glychee/configuration

pub fn main() {
  // Configuration is optional
  configuration.initialize()
  configuration.set_pair(configuration.Warmup, 4)
  configuration.set_pair(configuration.Parallel, 16)

  let sorted = list.range(0, 100_000)
  let reversed = sorted |> list.reverse
  let shuffled = sorted |> list.shuffle

  // Run the benchmarks
  benchmark.run(
    [
      benchmark.Function(label: "list_sort_erlang.sort()", callable: fn(test_data) {
        fn() { list_sort_erlang.sort(test_data) }
      }),
      benchmark.Function(label: "list_pre_pr.sort()", callable: fn(test_data) {
        fn() { list_pre_pr.sort(test_data, int.compare) }
      }),
      benchmark.Function(label: "list.sort()", callable: fn(test_data) {
        fn() { list.sort(test_data, int.compare) }
      }),
    ],
    [
      benchmark.Data(label: "sorted list", data: sorted),
      benchmark.Data(label: "reversed list", data: reversed),
      benchmark.Data(label: "shuffled list", data: shuffled),
    ],
  )
}
