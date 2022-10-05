#! / bin / bash

if [ "$1" = "" ]
then
echo -e "Enter new web page name ... \c"
read "page"
else
page="$1"
fi
# The following creates the correct filename
# regardless of the extension entered ...
page=`echo "$page"|awk -F\. '{print $1}'`
page=${page}.html
# I use tmp to spell check all new files:
echo $page >>tmp
# start with a standard HTML header:
cp pageheader $page
nano $page
# close the file with a standard footer:
cat pagefooter >> $page
# Don't know where the *bak files come from
# but I don't like them ...
if [ -f "*bak" ]
then
rm -f *bak
fi