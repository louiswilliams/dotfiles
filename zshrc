# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=~/.oh-my-zsh
export PATH=~/.local/bin:~/.bin/:~/.cargo/bin:$PATH
export GOPATH=~/.go

export NINJA_STATUS='[%f/%t (%p) %es] '

alias activate='source python3-venv/bin/activate'
alias resmoke='python3 buildscripts/resmoke.py'
alias vimrc='vim ~/.vimrc'
#alias cr='python3 ~/git/kernel-tools/codereview/upload.py --no_oauth2_webbrowser -s mongodbcr.appspot.com \
          #--cc codereview-mongo@10gen.com,serverteam-storage-execution@mongodb.com --jira_user=louis.williams'
alias cr="dbus-run-session -- python ~/git/server-workflow-tool/jira_credentials.py create-cr \
          -s mongodbcr.appspot.com --no_oauth2_webbrowser --jira_user=louis.williams \
          --cc codereview-mongo@10gen.com,serverteam-storage-execution@mongodb.com"
alias merge-base="git merge-base HEAD master"
alias git-delete-merged="git branch --merged | egrep -v \"(^\*|master)\" | xargs git branch -d"

alias opt-ninja="python3 buildscripts/scons.py --opt=on --dbg=off\
	CCFLAGS='-fdiagnostics-color=always' \
	--variables-files=etc/scons/developer_versions.vars \
	--variables-files=etc/scons/mongodbtoolchain_stable_clang.vars ICECC=icecc CCACHE=ccache \
    VARIANT_DIR=opt --modules= NINJA_PREFIX=opt --link-model=static --ninja opt.ninja"

alias build-ninja="python3 ./buildscripts/scons.py --dbg \
	CCFLAGS='-fdiagnostics-color=always' \
    VARIANT_DIR=debug \
	--variables-files=etc/scons/developer_versions.vars \
	--variables-files=etc/scons/mongodbtoolchain_v4_clang.vars ICECC=icecc CCACHE=ccache \
	--link-model=dynamic --ninja build.ninja"

alias gcc-ninja=" python3 ./buildscripts/scons.py --dbg=off --opt=on \
	--variables-files=etc/scons/developer_versions.vars \
    --variables-files=etc/scons/mongodbtoolchain_v3_gcc.vars --allocator=system \
    --link-model=dynamic VARIANT_DIR=gcc NINJA_PREFIX=gcc \
    CCACHE=ccache ICECC=icecc --modules= --ninja gcc.ninja"

alias asan-ninja=" python3 ./buildscripts/scons.py --dbg=off --opt=on \
	--variables-files=etc/scons/developer_versions.vars \
    --variables-files=etc/scons/mongodbtoolchain_v3_clang.vars --allocator=system \
    --link-model=static --sanitize=address VARIANT_DIR=asan NINJA_PREFIX=asan \
    CCFLAGS='-fsanitize=address -fsanitize-coverage=func'
    CCACHE=ccache ICECC=icecc --modules= --ninja asan.ninja"

function buildcompiledb() {
            ./buildscripts/scons.py --dbg VARIANT_DIR=debug \
            --disable-warnings-as-errors \
            --variables-files=etc/scons/mongodbtoolchain_v4_clang.vars\
            compile_commands.json generated-sources
}

alias gdb-add-mongod-index="find  build/ -name '*.so' | xargs -I % -P 16 gdb-add-index % && gdb-add-index mongod"

alias rdmf="journalctl --user -u rdm -f"

alias changes="git diff \`merge-base\`"


alias mongowt='wt -C "extensions=["/home/louis/git/wiredtiger/ext/compressors/snappy/.libs/libwiredtiger_snappy.so"],log=(compressor=snappy,path=journal)"'
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="louis"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias vi="vim"

alias gs="git status"
alias gl="git log"
alias gc="git commit"
alias ga="git add . -u"
alias gg="git grep"
alias gp="git --no-pager show -s"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export GOPATH=$HOME/go
