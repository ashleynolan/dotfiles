#Puboish package
alias npub='npm publish'

#Upgrade package using interactive terminal
alias yupa='yarn upgrade-interactive --latest && yarn upgrade'
alias yup='yarn upgrade-interactive'
alias yupg='yarn up'

#Check integrity of packages installed
alias ycheck='yarn check --integrity'

#Force yarn install
alias yf='yarn --force'


#Add packages to project
function add {
	yarn add "$1"
}
#Add  packages to project as dev dependency
function adddev {
	yarn add "$1" --dev
}
#Remove packages to project
function remove {
	yarn remove "$1"
}

#Publish to yalc and push to linekd repos
alias ypub='yalc publish --push'

#Add packages to project as a yalc link
function yadd {
	yalc add "$1"
}
#Remove packages as a yalc link
function yremove {
	yalc remove "$1"
}

#turbo filter
function tf {
    FILTER=''
    if [[ $2 ]];
    then
        FILTER='--filter=@justeattakeaway/'$2
    fi
	yarn "$1" "$FILTER"
}

function yhelp {
	echo "
- - - - - - - - - - - - - -
Yarn Convenience Shortcuts:
- - - - - - - - - - - - - -
npub - Publish package via NPM
yup - Upgrade package dependencies (and downstream dependencies)
ycheck - Check integrity of packages installed
yf - Force yarn install
add/remove - shortcuts for adding and removing packages
- - - - - - - - - - - - - -
"
}
