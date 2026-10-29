# Running Flask with gunicorn

I replaced `python app.py` with gunicorn, so Flask doesn't run on its dev server anymore.

## Steps

1. Install it inside the venv: `pip install gunicorn`
2. Wrap `app.run()` in `app.py` so gunicorn doesn't start a second server:

```python
if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000)
```

3. Stop the old Flask (Ctrl+c), then run: `gunicorn -b 127.0.0.1:5000 app:app`
4. Test it: `curl localhost:5000` (direct) and `curl localhost` (through nginx)

## Things that went wrong

- I forgot `app:app` and got "No application module specified".
- I forgot the `:` in the `if __name__ == "__main__"` line and gunicorn couldn't boot the worker.
