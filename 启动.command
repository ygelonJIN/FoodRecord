#!/bin/bash
cd "$(dirname "$0")" || exit 1
PORT=8777
IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)

echo ""
echo "  饮食记录 · 本地服务"
echo "  电脑访问: http://127.0.0.1:$PORT"
if [ -n "$IP" ]; then
  echo "  手机访问: http://$IP:$PORT   （需要连同一个 WiFi）"
else
  echo "  没检测到局域网 IP，确认已连上 WiFi"
fi
echo "  停止服务: 按 Control + C"
echo ""

open "http://127.0.0.1:$PORT" 2>/dev/null
python3 -m http.server $PORT --bind 0.0.0.0
