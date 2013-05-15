#!/usr/bin/env bash
waitTime=5;
path="${PWD}/sass";
echo "Converting CSS in the \"$path\" directory to Sassy Tabbed CSS!";

if [[ -z "${1}" ]];
    then
        sFiles="*.css";
else
    if [[ ! -f $path/$1 ]];
        then
            echo "File Not Found!!!";
            exit $?;
    else
        sFiles=${1};
    fi
fi

for file in $path/$sFiles;
    do
        fileName=$(basename "$file");
        extension="${fileName##*.}";
        name="${fileName%.*}";
        #echo "Base filename = $name";
        #echo "Extension = $extension";
        
        #echo "Converting $fileName to SCSS tabbed format.";
        
        #SASS Convert
        sass-convert -F css -T scss --indent 4 $file $path/_$name.scss;
        
        #Remove old CSS
        echo "Waiting $waitTime seconds for conversion to finish..."
        sleep $waitTime;
        echo "Removing $file...";
        rm $file
        
        #Confirmation
        echo "$file converted to _$name.scss."
done

echo "Sassy Conversion Done!"

#eof