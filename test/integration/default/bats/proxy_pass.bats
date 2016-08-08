@test "verified that curl bing is functioning properly" {
    result=$(curl 'http://localhost/bing/search?q=hello')
    result2=$(curl 'http://www.bing.com/search?q=Hello')
    ["$result" = "$result2"]
}


@test "verified that curl bing is functioning properly" {
    result3=$(curl 'http://localhost/weather/today/l/USGA0028:1:US')
    result4=$(curl 'https://weather.com/weather/today/l/USGA0028:1:US')
    ["$result3" = "$result4"]
}