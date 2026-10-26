# Day 1: server status report using variables, types and f-strings
# Any line starting with # is a comment. Python skips it, like in Bash.

server_name = "web01"          # str (string) = text. Quotes " " mark where the text starts and ends
ip_address = "10.0.1.15"       # str: an IP is text, not a number, because it has several dots
port = 80                      # int (integer) = whole number. No quotes, so Python treats it as a number
cpu_usage = 72.5               # float = number with a decimal point
memory_used_gb = 3.2           # float: memory in use, in GB
memory_total_gb = 8            # int: total memory, in GB
is_running = True              # bool (boolean) = only True or False. Capital T, no quotes

memory_free_gb = memory_total_gb - memory_used_gb    # - subtracts. Both are numbers, so this is real math (8 - 3.2 = 4.8)

print("===== Server Report =====")                       # print() shows text on screen. No f, because there are no variables inside
print(f"Server : {server_name} ({ip_address})")         # f before the quote = formatted string. Python replaces each {name} with that variable's value
print(f"Port   : {port}")                               # {port} is filled with 80. The f-string turns the number into text for you, so no str() is needed
print(f"Status : {'UP' if is_running else 'DOWN'}")     # inside { } you can put code: show 'UP' if is_running is True, otherwise 'DOWN'. Single quotes inside, because the outer quotes are double
print(f"CPU    : {cpu_usage}%")                         # % here is just a normal character printed after the number
print(f"Memory : {memory_used_gb} GB used / {memory_total_gb} GB total")   # one f-string can hold several { } variables
print(f"Free   : {memory_free_gb} GB")                  # prints the result of the subtraction above
print("=========================")                       # closing line, no variables, so no f needed
