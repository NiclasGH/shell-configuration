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

# Create tmux session in dev folder
function tc() {
	session=$1
	project="$HOME/dev/$session"

	if [[ -z $session ]]; then
		echo "Usage: tc <project-name>"
		echo "Available projects:"
		ls -1 ~/dev/
		return 1
	fi

	tmux has-session -t $session &> /dev/null

	if [[ $? != 0 ]]; then # exit code
		if [[ ! -d $project ]]; then
			echo "$project does not exist"
			return 1
		fi

		tmux new-session -s $session -d
		tmux send-keys -t $session "vim $project" C-m
	fi

	tmux attach -t $session
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
