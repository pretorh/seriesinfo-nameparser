set -e
clear
for f in tests/*; do
    echo $f
    perl $f
done
