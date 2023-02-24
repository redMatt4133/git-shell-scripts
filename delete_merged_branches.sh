git fetch origin --prune
clear
while read b; do
    echo "Attempting to delete $b"
    git push origin --delete $b
    # minor delay needed to prevent connection abort errors
    echo Sleeping for 5 seconds before proceeding
    sleep 5
done <../merged_branches.txt
