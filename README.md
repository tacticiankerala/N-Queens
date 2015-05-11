NQueens
=======
N-Queens problem is an extension of the more popular [8-queens
problem](http://en.wikipedia.org/wiki/Eight_queens_puzzle)

##Benchmark
size      | time
--------- | -----
8-queens  | 0.19s user 0.09s system 127% cpu 0.222 total
12-queens | 0.21s user 0.11s system 129% cpu 0.244 total
16-queens | 0.29s user 0.10s system 119% cpu 0.325 total
20-queens | 2.79s user 0.10s system 102% cpu 2.826 total
24-queens | 7.50s user 0.10s system 100% cpu 7.533 total

Tested on - MacBook Pro 2.7 GHz Intel Core i7, 16 GB RAM

##How to run?

- You need Erlang VM to run this app (you do not need to install elixir
for running this app). Instructions for installing Erlang is
[here](http://elixir-lang.org/install.html)
- Clone the repo - ```git clone
  https://github.com/tacticiankerala/N-Queens.git ~/n_queens```
- Go to the directory - ```cd ~/n_queens```
- Execute - ```./n_queens <size>```
