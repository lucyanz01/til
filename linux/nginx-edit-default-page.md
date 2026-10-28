# Editing the default nginx page

I edited the deafault nginx page with `sudo nano /var/www/html/index.nginx-debian.html`.
Nninx served the change right away, with no nginx reload needed because static files are read on every request. 
I checked it at `localhost:8080` (port forward 8080 to 80).
