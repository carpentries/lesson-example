ALL_IN_ONE=all-in-one.md

echo '---' > $ALL_IN_ONE
echo 'layout: lesson' >> $ALL_IN_ONE
echo '---' >> $ALL_IN_ONE

for file in $(find _site | grep -E '??-.*index.html' | sort)
do
xmllint --html --xpath '/html/body/div/div/div[2]/h1' $file >> $ALL_IN_ONE
xmllint --html --xpath '/html/body/div/article' $file >> $ALL_IN_ONE
done

