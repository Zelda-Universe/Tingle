#!/usr/bin/env bash

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

numChars="${1-32}";

# printf '\x'"$(printf '%x' "$(echo "($(printf '%d' '0x'"$(echo -n '!' | xxd -p)") % 95) + 32" | bc)")";

# printf '\x'"$(printf '%x' "$(echo "($(printf '%d' '0x'"$(head -c 1 /dev/urandom | xxd -p)") % 95) + 32" | bc)")";


for i in $(seq 1 $numChars); do
  printf '\x'"$(printf '%x' "$(echo "($(printf '%d' '0x'"$(head -c 1 /dev/urandom | xxd -p)") % 95) + 32" | bc)")";
done


# while true; do
#   printf '\x'"$(printf '%x' "$(echo "($(printf '%d' '0x'"$(head -c 1 /dev/urandom | xxd -p)") % 95) + 32" | bc)")";
#   read -p "...";
# done



# while true; do
#   randomHexValue="$(head -c 1 /dev/urandom | xxd -p)";
#   echo "randomHexValue: $randomHexValue";
#
#   randomDecimalValue="$(printf '%d' '0x'"$randomHexValue")";
#   echo "randomDecimalValue: $randomDecimalValue";
#
#   randomScopedDecimalValue="$(echo "($randomDecimalValue % 95) + 32" | bc)";
#   echo "randomScopedDecimalValue: $randomScopedDecimalValue";
#
#   randomScopedHexValue="$(printf '%x' "$randomScopedDecimalValue")";
#   echo "randomScopedHexValue: $randomScopedHexValue";
#
#   randomScopedCharacter="$(printf '\x'"$randomScopedHexValue")";
#   echo "randomScopedCharacter: $randomScopedCharacter";
#
#   read -p "...";
# done
