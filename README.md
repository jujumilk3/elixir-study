# elixir-study

## commands
### normal
1. `mix new {project_name}`
2. `mix format`

### in project
1. `mix deps`: dependencies 확인
2. `mix deps.get`: dependencies 다운로드
3. `mix test`
4. `mix escript.build`: 바이너리로 빌드

### githubfetch project
1. `iex -S mix`: mix project를 컴파일하며 iex 실행
2. `Issues.GithubIssues.fetch("elixir-lang", "elixir")`
3. `Issues.GithubIssues.process {"pragdave", "earmark", 1}`
4. 5번 project에서 `mix docs`: docs 제작


### spawn

1. `elixir --erl "+P 1000000" -r spawn/chain.exs -e "Chain.run(1000000)"` 