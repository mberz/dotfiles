# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
# export JAVA_TOOL_OPTIONS='-Djava.net.preferIPv4Stack=true'

# Add Python from Homebrew to the path
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Add homebrew to the path
export PATH=/usr/local/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
