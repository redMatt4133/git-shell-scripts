before_date='1 month ago'
echo fetching the latest from the remote repository before running the query...
git fetch origin --prune
clear
echo Quering branches merged into main last updated over $before_date
for k in $(git branch --merge origin/main -r | grep --invert-match origin/main | sed /\*/d); do
    if [ "$(git log --before="$before_date" $k^..$k )" ]; then
        # display results to the terminal
        echo $(git show --format="%cd" $k | head -n 1) $k^
        # format branch name to remove the 'origin/' prefix
        branch=$(echo $k | sed 's/origin\///')
        echo $branch >> ../merged_branches.txt
    fi
done
echo merge_branches.txt file created.
