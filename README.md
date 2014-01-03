# react + tbs-battle-planner

A work in progress React, Gulp workflow version of the [TBS BattlePlanner](tbs-battle-planner.herokuapp.com), right now it's just the React Tutorial.

- clone this repo
- `npm install -g gulp`
- `npm install`
- `gulp`
- put this in your ~/.bash_profile

```shell
# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}
```

- `server`

# todo:

- server side integration with gulp
- finish tutorial implementation