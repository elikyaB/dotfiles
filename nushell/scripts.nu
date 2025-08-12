def git_commit_push [message: string] {
    # Run the git commands in sequence
    git add .; 
    git commit -am $message; 
    git push origin main;
}
