# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_magic_global_optspecs
	string join \n v/verbose q/quiet color= no-progress h/help V/version
end

function __fish_magic_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_magic_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_magic_using_subcommand
	set -l cmd (__fish_magic_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c magic -n "__fish_magic_needs_command" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_needs_command" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_needs_command" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_needs_command" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_needs_command" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_needs_command" -s V -l version -d 'Print version'
complete -c magic -n "__fish_magic_needs_command" -f -a "init" -d 'Creates a new project'
complete -c magic -n "__fish_magic_needs_command" -f -a "add" -d 'Adds dependencies to the project'
complete -c magic -n "__fish_magic_needs_command" -f -a "a" -d 'Adds dependencies to the project'
complete -c magic -n "__fish_magic_needs_command" -f -a "remove" -d 'Removes dependencies from the project'
complete -c magic -n "__fish_magic_needs_command" -f -a "rm" -d 'Removes dependencies from the project'
complete -c magic -n "__fish_magic_needs_command" -f -a "install" -d 'Install all dependencies'
complete -c magic -n "__fish_magic_needs_command" -f -a "i" -d 'Install all dependencies'
complete -c magic -n "__fish_magic_needs_command" -f -a "update" -d 'Update dependencies as recorded in the local lock file'
complete -c magic -n "__fish_magic_needs_command" -f -a "upgrade" -d 'Update the version of packages to the latest possible version, disregarding the manifest version constraints'
complete -c magic -n "__fish_magic_needs_command" -f -a "run" -d 'Runs task in project'
complete -c magic -n "__fish_magic_needs_command" -f -a "r" -d 'Runs task in project'
complete -c magic -n "__fish_magic_needs_command" -f -a "exec" -d 'Run a command in a temporary environment'
complete -c magic -n "__fish_magic_needs_command" -f -a "x" -d 'Run a command in a temporary environment'
complete -c magic -n "__fish_magic_needs_command" -f -a "shell" -d 'Start a shell in the pixi environment of the project'
complete -c magic -n "__fish_magic_needs_command" -f -a "s" -d 'Start a shell in the pixi environment of the project'
complete -c magic -n "__fish_magic_needs_command" -f -a "shell-hook" -d 'Print the pixi environment activation script'
complete -c magic -n "__fish_magic_needs_command" -f -a "project" -d 'Modify the project configuration file through the command line'
complete -c magic -n "__fish_magic_needs_command" -f -a "task" -d 'Interact with tasks in the project'
complete -c magic -n "__fish_magic_needs_command" -f -a "list" -d 'List project\'s packages'
complete -c magic -n "__fish_magic_needs_command" -f -a "ls" -d 'List project\'s packages'
complete -c magic -n "__fish_magic_needs_command" -f -a "tree" -d 'Show a tree of project dependencies'
complete -c magic -n "__fish_magic_needs_command" -f -a "t" -d 'Show a tree of project dependencies'
complete -c magic -n "__fish_magic_needs_command" -f -a "global" -d 'Subcommand for global package management actions'
complete -c magic -n "__fish_magic_needs_command" -f -a "g" -d 'Subcommand for global package management actions'
complete -c magic -n "__fish_magic_needs_command" -f -a "auth" -d 'Login to prefix.dev or anaconda.org servers to access private channels'
complete -c magic -n "__fish_magic_needs_command" -f -a "config" -d 'Configuration management'
complete -c magic -n "__fish_magic_needs_command" -f -a "info" -d 'Information about the system, project and environments for the current machine'
complete -c magic -n "__fish_magic_needs_command" -f -a "upload" -d 'Upload a conda package'
complete -c magic -n "__fish_magic_needs_command" -f -a "search" -d 'Search a conda package'
complete -c magic -n "__fish_magic_needs_command" -f -a "self-update" -d 'Update pixi to the latest version or a specific version'
complete -c magic -n "__fish_magic_needs_command" -f -a "clean" -d 'Clean the parts of your system which are touched by pixi. Defaults to cleaning the environments and task cache. Use the `cache` subcommand to clean the cache'
complete -c magic -n "__fish_magic_needs_command" -f -a "completion" -d 'Generates a completion script for a shell'
complete -c magic -n "__fish_magic_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand init" -s c -l channel -d 'Channels to use in the project' -r
complete -c magic -n "__fish_magic_using_subcommand init" -s p -l platform -d 'Platforms that the project supports' -r
complete -c magic -n "__fish_magic_using_subcommand init" -s i -l import -d 'Environment.yml file to bootstrap the project' -r -F
complete -c magic -n "__fish_magic_using_subcommand init" -l format -d 'The manifest format to create' -r -f -a "{pixi\t'',pyproject\t'',mojoproject\t''}"
complete -c magic -n "__fish_magic_using_subcommand init" -s s -l scm -d 'Source Control Management used for this project' -r -f -a "{github\t'',gitlab\t'',codeberg\t''}"
complete -c magic -n "__fish_magic_using_subcommand init" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand init" -l pyproject-toml -d 'Create a pyproject.toml manifest instead of a pixi.toml manifest'
complete -c magic -n "__fish_magic_using_subcommand init" -l mojoproject-toml -d 'Create a mojoproject.toml manifest instead of a pixi.toml manifest'
complete -c magic -n "__fish_magic_using_subcommand init" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand init" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand init" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand init" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand add" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand add" -s p -l platform -d 'The platform(s) for which the dependency should be modified' -r
complete -c magic -n "__fish_magic_using_subcommand add" -s f -l feature -d 'The feature for which the dependency should be modified' -r
complete -c magic -n "__fish_magic_using_subcommand add" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand add" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand add" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand add" -l host -d 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`'
complete -c magic -n "__fish_magic_using_subcommand add" -l build -d 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`'
complete -c magic -n "__fish_magic_using_subcommand add" -l pypi -d 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`'
complete -c magic -n "__fish_magic_using_subcommand add" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand add" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand add" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand add" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand add" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand add" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand add" -l editable -d 'Whether the pypi requirement should be editable'
complete -c magic -n "__fish_magic_using_subcommand add" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand add" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand add" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand a" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand a" -s p -l platform -d 'The platform(s) for which the dependency should be modified' -r
complete -c magic -n "__fish_magic_using_subcommand a" -s f -l feature -d 'The feature for which the dependency should be modified' -r
complete -c magic -n "__fish_magic_using_subcommand a" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand a" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand a" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand a" -l host -d 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`'
complete -c magic -n "__fish_magic_using_subcommand a" -l build -d 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`'
complete -c magic -n "__fish_magic_using_subcommand a" -l pypi -d 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`'
complete -c magic -n "__fish_magic_using_subcommand a" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand a" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand a" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand a" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand a" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand a" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand a" -l editable -d 'Whether the pypi requirement should be editable'
complete -c magic -n "__fish_magic_using_subcommand a" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand a" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand a" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand a" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand remove" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand remove" -s p -l platform -d 'The platform(s) for which the dependency should be modified' -r
complete -c magic -n "__fish_magic_using_subcommand remove" -s f -l feature -d 'The feature for which the dependency should be modified' -r
complete -c magic -n "__fish_magic_using_subcommand remove" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand remove" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand remove" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand remove" -l host -d 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`'
complete -c magic -n "__fish_magic_using_subcommand remove" -l build -d 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`'
complete -c magic -n "__fish_magic_using_subcommand remove" -l pypi -d 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`'
complete -c magic -n "__fish_magic_using_subcommand remove" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand remove" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand remove" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand remove" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand remove" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand remove" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand remove" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand remove" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand remove" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand rm" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand rm" -s p -l platform -d 'The platform(s) for which the dependency should be modified' -r
complete -c magic -n "__fish_magic_using_subcommand rm" -s f -l feature -d 'The feature for which the dependency should be modified' -r
complete -c magic -n "__fish_magic_using_subcommand rm" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand rm" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand rm" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand rm" -l host -d 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`'
complete -c magic -n "__fish_magic_using_subcommand rm" -l build -d 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`'
complete -c magic -n "__fish_magic_using_subcommand rm" -l pypi -d 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`'
complete -c magic -n "__fish_magic_using_subcommand rm" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand rm" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand rm" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand rm" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand rm" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand rm" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand rm" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand rm" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand rm" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand rm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand install" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand install" -s e -l environment -d 'The environment to install' -r
complete -c magic -n "__fish_magic_using_subcommand install" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand install" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand install" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand install" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand install" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand install" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand install" -s a -l all
complete -c magic -n "__fish_magic_using_subcommand install" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand install" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand install" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand install" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand i" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand i" -s e -l environment -d 'The environment to install' -r
complete -c magic -n "__fish_magic_using_subcommand i" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand i" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand i" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand i" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand i" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand i" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand i" -s a -l all
complete -c magic -n "__fish_magic_using_subcommand i" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand i" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand i" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand i" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand update" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand update" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand update" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand update" -s e -l environment -d 'The environments to update. If none is specified, all environments are updated' -r
complete -c magic -n "__fish_magic_using_subcommand update" -s p -l platform -d 'The platforms to update. If none is specified, all platforms are updated' -r
complete -c magic -n "__fish_magic_using_subcommand update" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand update" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand update" -l no-install -d 'Don\'t install the (solve) environments needed for pypi-dependencies solving'
complete -c magic -n "__fish_magic_using_subcommand update" -s n -l dry-run -d 'Don\'t actually write the lockfile or update any environment'
complete -c magic -n "__fish_magic_using_subcommand update" -l json -d 'Output the changes in JSON format'
complete -c magic -n "__fish_magic_using_subcommand update" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand update" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand update" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand update" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand upgrade" -s f -l feature -d 'The feature to update' -r
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l exclude -d 'The packages which should be excluded' -r
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l json -d 'Output the changes in JSON format'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -s n -l dry-run -d 'Only show the changes that would be made, without actually updating the manifest, lock file, or environment'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand upgrade" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand run" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand run" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand run" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand run" -s e -l environment -d 'The environment to run the task in' -r
complete -c magic -n "__fish_magic_using_subcommand run" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand run" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand run" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand run" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand run" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand run" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand run" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand run" -l clean-env -d 'Use a clean environment to run the task'
complete -c magic -n "__fish_magic_using_subcommand run" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand run" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand run" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand r" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand r" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand r" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand r" -s e -l environment -d 'The environment to run the task in' -r
complete -c magic -n "__fish_magic_using_subcommand r" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand r" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand r" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand r" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand r" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand r" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand r" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand r" -l clean-env -d 'Use a clean environment to run the task'
complete -c magic -n "__fish_magic_using_subcommand r" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand r" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand r" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand r" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand exec" -s s -l spec -d 'Matchspecs of packages to install. If this is not provided, the package is guessed from the command' -r
complete -c magic -n "__fish_magic_using_subcommand exec" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand exec" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand exec" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand exec" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand exec" -l force-reinstall -d 'If specified a new environment is always created even if one already exists'
complete -c magic -n "__fish_magic_using_subcommand exec" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand exec" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand exec" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand exec" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand exec" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand x" -s s -l spec -d 'Matchspecs of packages to install. If this is not provided, the package is guessed from the command' -r
complete -c magic -n "__fish_magic_using_subcommand x" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand x" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand x" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand x" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand x" -l force-reinstall -d 'If specified a new environment is always created even if one already exists'
complete -c magic -n "__fish_magic_using_subcommand x" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand x" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand x" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand x" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand x" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand shell" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand shell" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand shell" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand shell" -s e -l environment -d 'The environment to activate in the shell' -r
complete -c magic -n "__fish_magic_using_subcommand shell" -l change-ps1 -d 'Do not change the PS1 variable when starting a prompt' -r -f -a "{true\t'',false\t''}"
complete -c magic -n "__fish_magic_using_subcommand shell" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand shell" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand shell" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand shell" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand shell" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand shell" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand shell" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand shell" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand shell" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand shell" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand shell" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand s" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand s" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand s" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand s" -s e -l environment -d 'The environment to activate in the shell' -r
complete -c magic -n "__fish_magic_using_subcommand s" -l change-ps1 -d 'Do not change the PS1 variable when starting a prompt' -r -f -a "{true\t'',false\t''}"
complete -c magic -n "__fish_magic_using_subcommand s" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand s" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand s" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand s" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand s" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand s" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand s" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand s" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand s" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand s" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand s" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -s s -l shell -d 'Sets the shell, options: [`bash`,  `zsh`,  `xonsh`,  `cmd`, `powershell`,  `fish`,  `nushell`]' -r
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -s e -l environment -d 'The environment to activate in the script' -r
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l change-ps1 -d 'Do not change the PS1 variable when starting a prompt' -r -f -a "{true\t'',false\t''}"
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l json -d 'Emit the environment variables set by running the activation as JSON'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand shell-hook" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -f -a "channel" -d 'Commands to manage project channels'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -f -a "description" -d 'Commands to manage project description'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -f -a "platform" -d 'Commands to manage project platforms'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -f -a "version" -d 'Commands to manage project version'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -f -a "environment" -d 'Commands to manage project environments'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -f -a "export" -d 'Commands to export projects to other formats'
complete -c magic -n "__fish_magic_using_subcommand project; and not __fish_seen_subcommand_from channel description platform version environment export help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -f -a "add" -d 'Adds a channel to the project file and updates the lockfile'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -f -a "a" -d 'Adds a channel to the project file and updates the lockfile'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -f -a "list" -d 'List the channels in the project file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -f -a "ls" -d 'List the channels in the project file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -f -a "remove" -d 'Remove channel(s) from the project file and updates the lockfile'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -f -a "rm" -d 'Remove channel(s) from the project file and updates the lockfile'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from channel" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from description" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from description" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from description" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from description" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from description" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from description" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from description" -f -a "get" -d 'Get the project description'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from description" -f -a "set" -d 'Set the project description'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from description" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -f -a "add" -d 'Adds a platform(s) to the project file and updates the lockfile'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -f -a "a" -d 'Adds a platform(s) to the project file and updates the lockfile'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -f -a "list" -d 'List the platforms in the project file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -f -a "ls" -d 'List the platforms in the project file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -f -a "remove" -d 'Remove platform(s) from the project file and updates the lockfile'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -f -a "rm" -d 'Remove platform(s) from the project file and updates the lockfile'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from platform" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -f -a "get" -d 'Get the project version'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -f -a "set" -d 'Set the project version'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -f -a "major" -d 'Bump the project version to MAJOR'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -f -a "minor" -d 'Bump the project version to MINOR'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -f -a "patch" -d 'Bump the project version to PATCH'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from version" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -f -a "add" -d 'Adds an environment to the manifest file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -f -a "a" -d 'Adds an environment to the manifest file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -f -a "list" -d 'List the environments in the manifest file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -f -a "ls" -d 'List the environments in the manifest file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -f -a "remove" -d 'Remove an environment from the manifest file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -f -a "rm" -d 'Remove an environment from the manifest file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from environment" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from export" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from export" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from export" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from export" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from export" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from export" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from export" -f -a "conda-explicit-spec" -d 'Export project environment to a conda explicit specification file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from export" -f -a "ces" -d 'Export project environment to a conda explicit specification file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from export" -f -a "conda-environment" -d 'Export project environment to a conda environment.yaml file'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from export" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "channel" -d 'Commands to manage project channels'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "description" -d 'Commands to manage project description'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "platform" -d 'Commands to manage project platforms'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "version" -d 'Commands to manage project version'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "environment" -d 'Commands to manage project environments'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "export" -d 'Commands to export projects to other formats'
complete -c magic -n "__fish_magic_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "add" -d 'Add a command to the project'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "a" -d 'Add a command to the project'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "remove" -d 'Remove a command from the project'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "rm" -d 'Remove a command from the project'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "alias" -d 'Alias another specific command'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "list" -d 'List all tasks in the project'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "ls" -d 'List all tasks in the project'
complete -c magic -n "__fish_magic_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -l depends-on -d 'Depends on these other commands' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -s p -l platform -d 'The platform for which the task should be added' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -s f -l feature -d 'The feature for which the task should be added' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -l cwd -d 'The working directory relative to the root of the project' -r -F
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -l env -d 'The environment variable to set, use --env key=value multiple times for more than one variable' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -l description -d 'A description of the task to be added' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -l clean-env -d 'Isolate the task from the shell environment, and only use the pixi environment to run the task'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -l depends-on -d 'Depends on these other commands' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -s p -l platform -d 'The platform for which the task should be added' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -s f -l feature -d 'The feature for which the task should be added' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -l cwd -d 'The working directory relative to the root of the project' -r -F
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -l env -d 'The environment variable to set, use --env key=value multiple times for more than one variable' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -l description -d 'A description of the task to be added' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -l clean-env -d 'Isolate the task from the shell environment, and only use the pixi environment to run the task'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from a" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from remove" -s p -l platform -d 'The platform for which the task should be removed' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from remove" -s f -l feature -d 'The feature for which the task should be removed' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from remove" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from remove" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from remove" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from remove" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from rm" -s p -l platform -d 'The platform for which the task should be removed' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from rm" -s f -l feature -d 'The feature for which the task should be removed' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from rm" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from rm" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from rm" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from rm" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from rm" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from alias" -s p -l platform -d 'The platform for which the alias should be added' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from alias" -l description -d 'The description of the alias task' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from alias" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from alias" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from alias" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from alias" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from alias" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from list" -s e -l environment -d 'The environment the list should be generated for. If not specified, the default environment is used' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from list" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from list" -s s -l summary -d 'Tasks available for this machine per environment'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from list" -l machine-readable -d 'Output the list of tasks from all environments in machine readable format (space delimited) this output is used for autocomplete by `pixi run`'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from ls" -s e -l environment -d 'The environment the list should be generated for. If not specified, the default environment is used' -r
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from ls" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from ls" -s s -l summary -d 'Tasks available for this machine per environment'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from ls" -l machine-readable -d 'Output the list of tasks from all environments in machine readable format (space delimited) this output is used for autocomplete by `pixi run`'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from ls" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a command to the project'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a command from the project'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "alias" -d 'Alias another specific command'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all tasks in the project'
complete -c magic -n "__fish_magic_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand list" -l platform -d 'The platform to list packages for. Defaults to the current platform' -r
complete -c magic -n "__fish_magic_using_subcommand list" -l sort-by -d 'Sorting strategy' -r -f -a "{size\t'',name\t'',kind\t''}"
complete -c magic -n "__fish_magic_using_subcommand list" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand list" -s e -l environment -d 'The environment to list packages for. Defaults to the default environment' -r
complete -c magic -n "__fish_magic_using_subcommand list" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand list" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand list" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand list" -l json -d 'Whether to output in json format'
complete -c magic -n "__fish_magic_using_subcommand list" -l json-pretty -d 'Whether to output in pretty json format'
complete -c magic -n "__fish_magic_using_subcommand list" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand list" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand list" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand list" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand list" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand list" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand list" -s x -l explicit -d 'Only list packages that are explicitly defined in the project'
complete -c magic -n "__fish_magic_using_subcommand list" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand list" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand list" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand ls" -l platform -d 'The platform to list packages for. Defaults to the current platform' -r
complete -c magic -n "__fish_magic_using_subcommand ls" -l sort-by -d 'Sorting strategy' -r -f -a "{size\t'',name\t'',kind\t''}"
complete -c magic -n "__fish_magic_using_subcommand ls" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand ls" -s e -l environment -d 'The environment to list packages for. Defaults to the default environment' -r
complete -c magic -n "__fish_magic_using_subcommand ls" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand ls" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand ls" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand ls" -l json -d 'Whether to output in json format'
complete -c magic -n "__fish_magic_using_subcommand ls" -l json-pretty -d 'Whether to output in pretty json format'
complete -c magic -n "__fish_magic_using_subcommand ls" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand ls" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand ls" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand ls" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand ls" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand ls" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand ls" -s x -l explicit -d 'Only list packages that are explicitly defined in the project'
complete -c magic -n "__fish_magic_using_subcommand ls" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand ls" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand ls" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand tree" -s p -l platform -d 'The platform to list packages for. Defaults to the current platform' -r
complete -c magic -n "__fish_magic_using_subcommand tree" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand tree" -s e -l environment -d 'The environment to list packages for. Defaults to the default environment' -r
complete -c magic -n "__fish_magic_using_subcommand tree" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand tree" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand tree" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand tree" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand tree" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand tree" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand tree" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand tree" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand tree" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand tree" -s i -l invert -d 'Invert tree and show what depends on given package in the regex argument'
complete -c magic -n "__fish_magic_using_subcommand tree" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand tree" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand tree" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand tree" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand t" -s p -l platform -d 'The platform to list packages for. Defaults to the current platform' -r
complete -c magic -n "__fish_magic_using_subcommand t" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand t" -s e -l environment -d 'The environment to list packages for. Defaults to the default environment' -r
complete -c magic -n "__fish_magic_using_subcommand t" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand t" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand t" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand t" -l no-lockfile-update -d 'Don\'t update lockfile, implies the no-install as well'
complete -c magic -n "__fish_magic_using_subcommand t" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand t" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c magic -n "__fish_magic_using_subcommand t" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c magic -n "__fish_magic_using_subcommand t" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand t" -l revalidate -d 'Run the complete environment validation. This will reinstall a broken environment'
complete -c magic -n "__fish_magic_using_subcommand t" -s i -l invert -d 'Invert tree and show what depends on given package in the regex argument'
complete -c magic -n "__fish_magic_using_subcommand t" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand t" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand t" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand t" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "add" -d 'Adds dependencies to an environment'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "a" -d 'Adds dependencies to an environment'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "edit" -d 'Edit the global manifest file'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "install" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "i" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "uninstall" -d 'Uninstalls environments from the global environment.'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "remove" -d 'Removes dependencies from an environment'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "rm" -d 'Removes dependencies from an environment'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "list" -d 'Lists all packages previously installed into a globally accessible location via `pixi global install`.'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "ls" -d 'Lists all packages previously installed into a globally accessible location via `pixi global install`.'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "sync" -d 'Sync global manifest with installed environments'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "s" -d 'Sync global manifest with installed environments'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "expose" -d 'Interact with the exposure of binaries in the global environment'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "e" -d 'Interact with the exposure of binaries in the global environment'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "update" -d 'Updates environments in the global environment'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "upgrade" -d 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "upgrade-all" -d 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead'
complete -c magic -n "__fish_magic_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from add" -s e -l environment -d 'Specifies the environment that the dependencies need to be added to' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from add" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from add" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from add" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from add" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from add" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from add" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from add" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from add" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from a" -s e -l environment -d 'Specifies the environment that the dependencies need to be added to' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from a" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from a" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from a" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from a" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from a" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from a" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from a" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from a" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from a" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from edit" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from edit" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from edit" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from edit" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -s p -l platform -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -s e -l environment -d 'Ensures that all packages will be installed in the same environment' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -l with -d 'Add additional dependencies to the environment. Their executables will not be exposed' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -l force-reinstall -d 'Specifies that the packages should be reinstalled even if they are already installed'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -s p -l platform -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -s e -l environment -d 'Ensures that all packages will be installed in the same environment' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -l with -d 'Add additional dependencies to the environment. Their executables will not be exposed' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -l force-reinstall -d 'Specifies that the packages should be reinstalled even if they are already installed'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from i" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from remove" -s e -l environment -d 'Specifies the environment that the dependencies need to be removed from' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from remove" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from remove" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from remove" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from remove" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from remove" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from remove" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from remove" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from rm" -s e -l environment -d 'Specifies the environment that the dependencies need to be removed from' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from rm" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from rm" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from rm" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from rm" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from rm" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from rm" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from rm" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from rm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from list" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from list" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from list" -s e -l environment -d 'The name of the environment to list' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from list" -l sort-by -d 'Sorting strategy for the package table of an environment' -r -f -a "{size\t'',name\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from list" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from list" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from ls" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from ls" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from ls" -s e -l environment -d 'The name of the environment to list' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from ls" -l sort-by -d 'Sorting strategy for the package table of an environment' -r -f -a "{size\t'',name\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from ls" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from ls" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from ls" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from sync" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from sync" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from sync" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from sync" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from sync" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from sync" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from sync" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from sync" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from s" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from s" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from s" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from s" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from s" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from s" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from s" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from expose" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from expose" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from expose" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from expose" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from expose" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from expose" -f -a "add" -d 'Add exposed binaries from an environment to your global environment'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from expose" -f -a "remove" -d 'Remove exposed binaries from the global environment'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from expose" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from e" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from e" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from e" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from e" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from e" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from e" -f -a "add" -d 'Add exposed binaries from an environment to your global environment'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from e" -f -a "remove" -d 'Remove exposed binaries from the global environment'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from e" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from update" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from update" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from update" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from update" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from update" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade" -l platform -d 'The platform to install the package for' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l platform -d 'The platform to install the package for' -r
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "add" -d 'Adds dependencies to an environment'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit the global manifest file'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "install" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Uninstalls environments from the global environment.'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Removes dependencies from an environment'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "list" -d 'Lists all packages previously installed into a globally accessible location via `pixi global install`.'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "sync" -d 'Sync global manifest with installed environments'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "expose" -d 'Interact with the exposure of binaries in the global environment'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "update" -d 'Updates environments in the global environment'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "upgrade" -d 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "upgrade-all" -d 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead'
complete -c magic -n "__fish_magic_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "add" -d 'Adds dependencies to an environment'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "a" -d 'Adds dependencies to an environment'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "edit" -d 'Edit the global manifest file'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "install" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "i" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "uninstall" -d 'Uninstalls environments from the global environment.'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "remove" -d 'Removes dependencies from an environment'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "rm" -d 'Removes dependencies from an environment'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "list" -d 'Lists all packages previously installed into a globally accessible location via `pixi global install`.'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "ls" -d 'Lists all packages previously installed into a globally accessible location via `pixi global install`.'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "sync" -d 'Sync global manifest with installed environments'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "s" -d 'Sync global manifest with installed environments'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "expose" -d 'Interact with the exposure of binaries in the global environment'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "e" -d 'Interact with the exposure of binaries in the global environment'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "update" -d 'Updates environments in the global environment'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "upgrade" -d 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "upgrade-all" -d 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead'
complete -c magic -n "__fish_magic_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e update upgrade upgrade-all help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from add" -s e -l environment -d 'Specifies the environment that the dependencies need to be added to' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from add" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from add" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from add" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from add" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from add" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from add" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from add" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from add" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from a" -s e -l environment -d 'Specifies the environment that the dependencies need to be added to' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from a" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from a" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from a" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from a" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from a" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from a" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from a" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from a" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from a" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from edit" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from edit" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from edit" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from edit" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -s p -l platform -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -s e -l environment -d 'Ensures that all packages will be installed in the same environment' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -l with -d 'Add additional dependencies to the environment. Their executables will not be exposed' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -l force-reinstall -d 'Specifies that the packages should be reinstalled even if they are already installed'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -s p -l platform -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -s e -l environment -d 'Ensures that all packages will be installed in the same environment' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -l with -d 'Add additional dependencies to the environment. Their executables will not be exposed' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -l force-reinstall -d 'Specifies that the packages should be reinstalled even if they are already installed'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from i" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from remove" -s e -l environment -d 'Specifies the environment that the dependencies need to be removed from' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from remove" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from remove" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from remove" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from remove" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from remove" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from remove" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from remove" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from rm" -s e -l environment -d 'Specifies the environment that the dependencies need to be removed from' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from rm" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from rm" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from rm" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from rm" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from rm" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from rm" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from rm" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from rm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from list" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from list" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from list" -s e -l environment -d 'The name of the environment to list' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from list" -l sort-by -d 'Sorting strategy for the package table of an environment' -r -f -a "{size\t'',name\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from list" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from list" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from ls" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from ls" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from ls" -s e -l environment -d 'The name of the environment to list' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from ls" -l sort-by -d 'Sorting strategy for the package table of an environment' -r -f -a "{size\t'',name\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from ls" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from ls" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from ls" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from sync" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from sync" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from sync" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from sync" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from sync" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from sync" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from sync" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from sync" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from s" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from s" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from s" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from s" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from s" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from s" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from s" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from expose" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from expose" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from expose" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from expose" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from expose" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from expose" -f -a "add" -d 'Add exposed binaries from an environment to your global environment'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from expose" -f -a "remove" -d 'Remove exposed binaries from the global environment'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from expose" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from e" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from e" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from e" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from e" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from e" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from e" -f -a "add" -d 'Add exposed binaries from an environment to your global environment'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from e" -f -a "remove" -d 'Remove exposed binaries from the global environment'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from e" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from update" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from update" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from update" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from update" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from update" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade" -l platform -d 'The platform to install the package for' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l pypi-keyring-provider -d 'Specifies if we want to use uv keyring provider' -r -f -a "{disabled\t'',subprocess\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l platform -d 'The platform to install the package for' -r
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "add" -d 'Adds dependencies to an environment'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit the global manifest file'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "install" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Uninstalls environments from the global environment.'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Removes dependencies from an environment'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "list" -d 'Lists all packages previously installed into a globally accessible location via `pixi global install`.'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "sync" -d 'Sync global manifest with installed environments'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "expose" -d 'Interact with the exposure of binaries in the global environment'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "update" -d 'Updates environments in the global environment'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "upgrade" -d 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "upgrade-all" -d 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead'
complete -c magic -n "__fish_magic_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -f -a "login" -d 'Store authentication information for a given host'
complete -c magic -n "__fish_magic_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -f -a "logout" -d 'Remove authentication information for a given host'
complete -c magic -n "__fish_magic_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from login" -l token -d 'The token to use (for authentication with prefix.dev)' -r
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from login" -l username -d 'The username to use (for basic HTTP authentication)' -r
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from login" -l password -d 'The password to use (for basic HTTP authentication)' -r
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from login" -l conda-token -d 'The token to use on anaconda.org / quetz authentication' -r
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from login" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from login" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from login" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from login" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from login" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from logout" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from logout" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from logout" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from logout" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from logout" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "login" -d 'Store authentication information for a given host'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "logout" -d 'Remove authentication information for a given host'
complete -c magic -n "__fish_magic_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "edit" -d 'Edit the configuration file'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "list" -d 'List configuration values'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "ls" -d 'List configuration values'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "prepend" -d 'Prepend a value to a list configuration key'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "append" -d 'Append a value to a list configuration key'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "set" -d 'Set a configuration value'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "unset" -d 'Unset a configuration value'
complete -c magic -n "__fish_magic_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from edit" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from edit" -s l -l local -d 'Operation on project-local configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from edit" -s g -l global -d 'Operation on global configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from edit" -s s -l system -d 'Operation on system configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from edit" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from edit" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from edit" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from list" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from list" -l json -d 'Output in JSON format'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from list" -s l -l local -d 'Operation on project-local configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from list" -s g -l global -d 'Operation on global configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from list" -s s -l system -d 'Operation on system configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from ls" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from ls" -l json -d 'Output in JSON format'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from ls" -s l -l local -d 'Operation on project-local configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from ls" -s g -l global -d 'Operation on global configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from ls" -s s -l system -d 'Operation on system configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from ls" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from prepend" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from prepend" -s l -l local -d 'Operation on project-local configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from prepend" -s g -l global -d 'Operation on global configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from prepend" -s s -l system -d 'Operation on system configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from prepend" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from prepend" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from prepend" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from prepend" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from append" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from append" -s l -l local -d 'Operation on project-local configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from append" -s g -l global -d 'Operation on global configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from append" -s s -l system -d 'Operation on system configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from append" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from append" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from append" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from append" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from set" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from set" -s l -l local -d 'Operation on project-local configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from set" -s g -l global -d 'Operation on global configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from set" -s s -l system -d 'Operation on system configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from set" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from set" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from set" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from unset" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from unset" -s l -l local -d 'Operation on project-local configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from unset" -s g -l global -d 'Operation on global configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from unset" -s s -l system -d 'Operation on system configuration'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from unset" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from unset" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from unset" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit the configuration file'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "list" -d 'List configuration values'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "prepend" -d 'Prepend a value to a list configuration key'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "append" -d 'Append a value to a list configuration key'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "set" -d 'Set a configuration value'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "unset" -d 'Unset a configuration value'
complete -c magic -n "__fish_magic_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand info" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand info" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand info" -l extended -d 'Show cache and environment size'
complete -c magic -n "__fish_magic_using_subcommand info" -l json -d 'Whether to show the output as JSON or not'
complete -c magic -n "__fish_magic_using_subcommand info" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand info" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand info" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand info" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand upload" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand upload" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand upload" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand upload" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand upload" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand search" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c magic -n "__fish_magic_using_subcommand search" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand search" -s p -l platform -d 'The platform to search for, defaults to current platform' -r
complete -c magic -n "__fish_magic_using_subcommand search" -s l -l limit -d 'Limit the number of search results' -r
complete -c magic -n "__fish_magic_using_subcommand search" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand search" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand search" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand search" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand search" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand self-update" -l version -d 'The desired version (to downgrade or upgrade to). Update to the latest version if not specified' -r
complete -c magic -n "__fish_magic_using_subcommand self-update" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand self-update" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand self-update" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand self-update" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand self-update" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -l manifest-path -d 'The path to `pixi.toml` or `pyproject.toml`' -r -F
complete -c magic -n "__fish_magic_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -s e -l environment -d 'The environment directory to remove' -r
complete -c magic -n "__fish_magic_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -f -a "cache" -d 'Clean the cache of your system which are touched by pixi'
complete -c magic -n "__fish_magic_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -l pypi -d 'Clean only the pypi related cache'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -l conda -d 'Clean only the conda related cache'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -l mapping -d 'Clean only the mapping cache'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -l exec -d 'Clean only `exec` cache'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -l repodata -d 'Clean only the repodata cache'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -s y -l yes -d 'Answer yes to all questions'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from cache" -s h -l help -d 'Print help'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from help" -f -a "cache" -d 'Clean the cache of your system which are touched by pixi'
complete -c magic -n "__fish_magic_using_subcommand clean; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand completion" -s s -l shell -d 'The shell to generate a completion script for' -r -f -a "{bash\t'Bourne Again SHell (bash)',elvish\t'Elvish shell',fish\t'Friendly Interactive SHell (fish)',nushell\t'Nushell',powershell\t'PowerShell',zsh\t'Z SHell (zsh)'}"
complete -c magic -n "__fish_magic_using_subcommand completion" -l color -d 'Whether the log needs to be colored' -r -f -a "{always\t'',never\t'',auto\t''}"
complete -c magic -n "__fish_magic_using_subcommand completion" -s v -l verbose -d 'Increase logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand completion" -s q -l quiet -d 'Decrease logging verbosity'
complete -c magic -n "__fish_magic_using_subcommand completion" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c magic -n "__fish_magic_using_subcommand completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "init" -d 'Creates a new project'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "add" -d 'Adds dependencies to the project'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "remove" -d 'Removes dependencies from the project'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "install" -d 'Install all dependencies'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "update" -d 'Update dependencies as recorded in the local lock file'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "upgrade" -d 'Update the version of packages to the latest possible version, disregarding the manifest version constraints'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "run" -d 'Runs task in project'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "exec" -d 'Run a command in a temporary environment'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "shell" -d 'Start a shell in the pixi environment of the project'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "shell-hook" -d 'Print the pixi environment activation script'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "project" -d 'Modify the project configuration file through the command line'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "task" -d 'Interact with tasks in the project'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "list" -d 'List project\'s packages'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "tree" -d 'Show a tree of project dependencies'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "global" -d 'Subcommand for global package management actions'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "auth" -d 'Login to prefix.dev or anaconda.org servers to access private channels'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "config" -d 'Configuration management'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "info" -d 'Information about the system, project and environments for the current machine'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "upload" -d 'Upload a conda package'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "search" -d 'Search a conda package'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "self-update" -d 'Update pixi to the latest version or a specific version'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "clean" -d 'Clean the parts of your system which are touched by pixi. Defaults to cleaning the environments and task cache. Use the `cache` subcommand to clean the cache'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "completion" -d 'Generates a completion script for a shell'
complete -c magic -n "__fish_magic_using_subcommand help; and not __fish_seen_subcommand_from init add remove install update upgrade run exec shell shell-hook project task list tree global auth config info upload search self-update clean completion help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "channel" -d 'Commands to manage project channels'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "description" -d 'Commands to manage project description'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "platform" -d 'Commands to manage project platforms'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "version" -d 'Commands to manage project version'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "environment" -d 'Commands to manage project environments'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "export" -d 'Commands to export projects to other formats'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "add" -d 'Add a command to the project'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "remove" -d 'Remove a command from the project'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "alias" -d 'Alias another specific command'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "list" -d 'List all tasks in the project'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "add" -d 'Adds dependencies to an environment'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "edit" -d 'Edit the global manifest file'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "install" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "uninstall" -d 'Uninstalls environments from the global environment.'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "remove" -d 'Removes dependencies from an environment'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "list" -d 'Lists all packages previously installed into a globally accessible location via `pixi global install`.'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "sync" -d 'Sync global manifest with installed environments'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "expose" -d 'Interact with the exposure of binaries in the global environment'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "update" -d 'Updates environments in the global environment'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "upgrade" -d 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "upgrade-all" -d 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "login" -d 'Store authentication information for a given host'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "logout" -d 'Remove authentication information for a given host'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "edit" -d 'Edit the configuration file'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "list" -d 'List configuration values'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "prepend" -d 'Prepend a value to a list configuration key'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "append" -d 'Append a value to a list configuration key'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "set" -d 'Set a configuration value'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "unset" -d 'Unset a configuration value'
complete -c magic -n "__fish_magic_using_subcommand help; and __fish_seen_subcommand_from clean" -f -a "cache" -d 'Clean the cache of your system which are touched by pixi'
complete -c BIN_NAME -n "__fish_seen_subcommand_from run; or __fish_seen_subcommand_from r" -f -a "(string split ' ' (BIN_NAME task list --machine-readable  2> /dev/null))"
