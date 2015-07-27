#!/bin/bash
# Used to archive feature or bugfix branch with tag 'archive/<JiraTicketNumber>'
export branch_name=$1
export tag_desc=$2

if [ "$branch_name" == "" ]; then
    echo "usage : git-archive-branch.sh <BranchName> <Tag description>"
else
    export jira_number=`echo $branch_name | sed -e "s/.*\///g" | sed "s/\([A-Z+]-[0-9][0-9][0-9][0-9]\).*/\1/g"`
    if [ "jira_number" != "" ]; then
        branchExistsLocally=$(git branch | grep -w "$branch_name")
        if [ "$branchExistsLocally" != "" ]; then
            if [ "$tag_desc" == "" ]; then
                # check if we can get summary from Jira using Jira-CLI
                if [ "$ATLASSIAN_CLI_HOME" != "" ]; then
                    export tag_desc=`jira.sh --action getFieldValue --issue "$jira_number" --field "summary" --quiet`
                fi
            fi
            if [ "$tag_desc" != "" ]; then
                echo -e "You just told me to archive the branch '$branch_name' as tag 'archive/$jira_number', delete branch '$branch_name' in local and remote repo. Then go back to the the 'develop' branch"
                read -p "$cWarning Are you sure you want to archive the branch '$branch_name'? [y/n] " prompt
                if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then
                    git checkout $branch_name
                    git pull origin $branch_name
                    git tag -a archive/$jira_number  -m "$tag_desc" $branch_name
                    echo "created archive tag 'archive/$jira_number"
                    
                    git push origin archive/$jira_number
                    git checkout develop
                    git push origin :$branch_name
                    git branch -d $branch_name
                    echo "deleted branch $branch_name locally and remotely successfully!!"
                    
                    echo "Archive tag 'archvie/$jira_number' is created on commit hash"
                    git log archive/$jira_number --format=oneline -1
                else
                    echo "branch archival cancelled"
                fi
            else
                echo "usage : git-archive-branch.sh <BranchName> <Tag description>"
            fi
        else
            echo "git branch '$branch_name' is not available in local repo. Just double-check to make sure you want to archive this branch. Typically, developers will have local checkout of the branch, they want to archive"
        fi
    else
        echo "Unable to extract Jira ticket number from branch name : '$branch_name' . Branch name should follow standard branch naming convention"
    fi
fi
