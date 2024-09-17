# watch.sh
#!/bin/bash

rm -rf build/
rm -rf output/
forester build forest.toml --dev

# 启动 HTTP 服务器在后台运行
# echo "Starting HTTP server on port 1313..."
# python3 -m http.server 1313 -d output &


echo "Cleanup build finished, watching..."

fswatch -o trees/ theme/ | while read num ; \
  do \
    clear
    echo "Rebuilding forest..."
    time forester build forest.toml --dev
    echo "Done"
  done
