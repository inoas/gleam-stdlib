set -eu
cd "$(dirname "$0")" && \
  cd .. && \
  gleam clean && \
  gleam build && \
  erl -pa ./build/dev/erlang/*/ebin -noshell -eval 'gleam_stdlib@@main:run(benchmark)'
