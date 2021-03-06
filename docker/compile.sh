#!/bin/sh
mkdir -p ./bin
docker run -v "$(pwd)/src:/ts_sources" -v "$(pwd)/bin:/bin_output" -t --rm ts_to_go:latest
if [ -f bin/main ]; then
  echo 'Compilation succeeded.'
  mv -f bin/main ./main && rmdir ./bin
  ls -al --color=auto -F ./main
else
  echo 'Compilation failed.'
fi
