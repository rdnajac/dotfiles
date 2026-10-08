set -l quote "The computing scientist's main challenge is not to get confused by the complexities of his own making."
if command -q lolcat
    echo $quote | lolcat
else
    echo $quote
end
# printf "\033[32mThe computing scientist's main challenge is not to get confused by the complexities of his own making.\033[0m\n" >&2
