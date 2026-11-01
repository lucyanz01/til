# Flask + Nginx + systemd on a local VM

Set up my second Flask practice app inside my Debian VM using Gunicorn and Nginx.

This time, I also created a systemd service to manage the Gunicorn process instead of relying on starting it manually.

I went through a second practice exercise using the same approach to get more familiar with each command and process, and to experiment with a few changes.

### Setup

1. Created the Flask app (`app_blog.py`).
2. Ran it with Gunicorn on `127.0.0.1:5001`.
3. Updated my QEMU startup script (`vm.sh`) to forward port `8081` from the host to the VM:

   ```bash
   hostfwd=tcp::8081-:8081
   ```

4. Configured Nginx to listen on port `8081` and forward requests to Gunicorn:

   ```nginx
   server {
       listen 8081;

       location / {
           proxy_pass http://127.0.0.1:5001;
       }
   }
   ```

5. Created a systemd service:

   ```bash
   sudo nano /etc/systemd/system/practice_blog.service
   ```

6. Enabled the service:

   ```bash
   sudo systemctl enable practice_blog
   ```

7. Started the service:

   ```bash
   sudo systemctl start practice_blog
   ```
8. Tested the app with curl:

   ```bash
   curl localhost:8081
   ```
   everything was ok.
   
### Notes
I took this one slower than the first project and paid more attention to each step. Since I had already gone through most of the setup before, I made fewer mistakes and had a better understanding of what I was doing.
