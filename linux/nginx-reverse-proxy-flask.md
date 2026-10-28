# nginx as a reverse proxy for Flask

Flask runs on `127.0.0.1:5000` and nginx listens on port 80 and forwards requests to it. From my PC I reach it at `localhost:8080` (QEMU forward 8080 to 80).
browser -> nginx (80) -> Flask (5000).

## Steps 

1. Server block in `/etc/nginx/sites-available/hello_flask`:

```nginx
server { 
  listen 80;

  location / {
    proxy_pass http://127.0.0.1:5000;
  }
}
```

2. Remove the default link: `sudo rm /etc/nginx/sites-enabled/default`
3. Enable mine: `sudo ln -s /etc/nginx/sites-available/hello_flask /etc/nginx/sites-enabled/hello_flask`
4. Check syntax: `sudo nginx -t`
5. Apply: `sudo systemctl reload nginx`

## Things that went wrong
- `sites-available` holds the config files, `sites-enabled` holds the links. I deleted the original instead of the link by mistake, and `nginx -t` failed with "No such file or directory".
- 502 Bad Gateway: the port in `proxy_pass` did not match Flask's (I wrote 500 instead of 5000).
