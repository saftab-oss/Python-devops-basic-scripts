# Day 2: log line analyzer, simple but real
# Uses: strip, split, [index], replace, startswith, int(), f-strings

raw = '  10.0.1.15 - - [26/Oct/2026:09:05:12] "GET /login HTTP/1.1" 500 1024 \n'   # one nginx access-log line, with messy spaces + newline

line = raw.strip()                        # .strip() removes spaces and \n from both ends
parts = line.split()                      # .split() cuts at every space, giving a list of 9 pieces, [0] to [8]

ip = parts[0]                             # [0] = client IP: who made the request
timestamp = parts[3].replace("[", "")     # [3] = '[26/Oct/2026:09:05:12' → .replace("[", "") deletes the [ (replace with nothing)
method = parts[4].replace('"', "")        # [4] = '"GET' → delete the " to get GET
path = parts[5]                           # [5] = /login, which page was requested
status = parts[7]                         # [7] = '500', the HTTP status code (still text)
size_bytes = int(parts[8])                # [8] = '1024' → int() turns text into a number

is_server_error = status.startswith("5")  # 5xx = the server broke. .startswith("5") gives True or False

print("===== Log Line Report =====")                                    # header, no variables so no f
print(f"Client IP : {ip}")                                              # f-string: {ip} is replaced by its value
print(f"Time      : {timestamp}")                                       # when it happened
print(f"Request   : {method} {path}")                                   # what was asked for
print(f"Status    : {status}")                                          # what the server answered
print(f"Size      : {size_bytes} bytes")                                # how much data was sent back
print(f"Alert     : {'INVESTIGATE' if is_server_error else 'OK'}")      # INVESTIGATE for any 5xx, otherwise OK
print("===========================")                                    # footer
