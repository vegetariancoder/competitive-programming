import re

import re

caption = "Leetcode daily streak achieved"

caption = re.sub(r'[^a-zA-Z\s]', '', caption)
words = caption.split()
camel_case = words[0].lower() + ''.join(word.capitalize() for word in words[1:])
caption = '#' + camel_case

print(caption[:100])