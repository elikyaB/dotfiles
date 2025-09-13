def git_commit_push [message: string] {
    let branch = (git branch --show-current);
    git add .; 
    git commit -am $message; 
    git push origin $branch;
}

def gh_pr_create_and_merge [base: string] {
    if (git status --porcelain) != "" {break}
    gh pr create -B $base -f;
    let branch = (git branch --show-current);
    mut prs = []
    loop {

        $prs = (gh pr ls --json number,baseRefName,headRefName,mergeStateStatus,state
            | from json
            | where baseRefName == $base
            | where headRefName == $branch
            | where mergeStateStatus == "CLEAN"
            | where state == "OPEN";)

        match ($prs | length) {
            0 => {
                print "Loading...";
                sleep 1sec;
                continue;
            },
            1 => {
                gh pr merge $branch --auto -m;
                break;
            },
            _ => {
                print "More than one possible PR for this head+base combination";
                break;
            }
        }

    }
}

def zellij_sessionizer [session: string] {
    zellij ls -s |
    fzf --query $session --select-1 --exit-0 --tiebreak=begin |
    if $in == "" {
        zellij -s $session;
    } else {
        # zellij action detach # uncomment when feature exists 
        zellij a -c -f $in;
    }
}
