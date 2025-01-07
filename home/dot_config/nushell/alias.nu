alias ll = ls -l
alias la = ls -al

alias vim = nvim

alias zj = zellij

alias lg = lazygit

def rider [dir?: string = "."] {
    # Find the single Rider application
    let rider_app = (ls /Applications/Rider*.app 
        | first 
        | get name?)

    if ($rider_app | is-empty) {
        print "No Rider installation found."
        return 1
    }

    # Find the single .sln file in the specified directory
    let sln_file = (glob $"($dir)/**/*.sln" 
        | first)

    if ($sln_file | is-empty) {
        print "No .sln file found in the specified directory or its subdirectories."
        return 1
    }

    # Open the .sln file with Rider
    ^open -na $rider_app --args $sln_file
}

