curl -x localhost:${PROXY_PORT:-8081} -X GET "https://localhost:5000/v1/api/one/user" -H  "accept: application/json" -d "" -k