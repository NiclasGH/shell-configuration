#!/usr/bin/env bash

# Managed by script. 
# Please keep this in sync using pull.sh before and push after making changes

function up() {
	levels=$1

	while [ "$levels" -gt "0" ]; do
		cd ..
		levels=$(($levels - 1))
	done
}

# Query bash aliases
function qa() {
	query=$1
	if [[ -z $query ]]; then
		echo "Please set a query"
		return 1
	fi

	cat ~/.bash_aliases | grep $query
	echo
	cat ~/.bash_device | grep $query
}

# Fuzzy moves into a project
function gdev() {
	query=$1
	project=$(find $HOME/dev/ -mindepth 1 -maxdepth 1 -type d | fzf --prompt="Select project: " -q "$query")
	if [[ -z $project ]]; then
		echo "No project selected"
		return 1
	fi

	cd $project
}

# Create tmux session in project folder
function gt() {
	query=$1

	project=$(find $HOME/dev -mindepth 1 -maxdepth 1 -type d | fzf --prompt="Select project: " -q "$query")
	if [[ -z $project ]]; then
		echo "No project selected"
		return 1
	fi

	session=$(basename "$project")

	tmux has-session -t $session &> /dev/null

	if [[ $? != 0 ]]; then # exit code
		# C-m is basically enter
		tmux new-session -d -s $session
		tmux rename-window -t $session:0 "Vim"
		tmux send-keys -t $session "vim $project" C-m

		tmux new-window -t $session:1 -n "Terminal"
		tmux send-keys -t "Terminal" "cd $project" C-m "clear" C-m
	fi

	tmux attach -t $session:0
}

# Rust
## Cargo watch install
function cwi() {
	cargo watch -x "install --path ."
}

## Cargo watch example
function cwe() {
	if [[ $# -eq 1 ]]; then
		cargo watch -q -c -x "run -q -example '$1'"
	else
		echo "Please give exactly 1 Parameter"
	fi
}

## Cargo watch test
## cwt | all tests
## cwt test_fn | specific named tests
## cwt test_file test_fn | specifid test in specifid file
function cwt() {
	if [[ $# -eq 1 ]]; then
		cargo watch -q -c -x "test '$1' -- --nocapture"
	elif [[ $# -eq 2 ]]; then
		cargo watch -q -c -x "test --test '$1' '$2' -- --nocapture"
	else
		cargo watch -q -c -x "test -- --nocapture"
	fi
}
