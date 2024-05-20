/// Sorts from smallest to largest based upon the ordering specified by a given
/// function.
///
/// ## Examples
///
/// ```gleam
/// import gleam/int
///
/// sort([4, 3, 6, 5, 4, 1, 2])
/// // -> [1, 2, 3, 4, 4, 5, 6]
/// ```
///
@external(erlang, "lists", "sort")
pub fn sort(list: List(a)) -> List(a)
