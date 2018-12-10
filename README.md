This repository contains my configuration files along with scripts to
move them into place or bootstrap a system to utilize them. This repo
is tailored to my own personal desires, so I would suggest taking pieces
that you want and incorporating them into your own configuration files
rather than outright using these.


## Usage
Do _NOT_ run the following command until you have backed up your
existing configuration files and read all files in this repository:

	$ sh setup-config.sh

If you are intending to use these configuration files from a fresh
install of a specific OS such as Fedora, use the helper script to
install all required packages, then run `setup-config.sh`:

	$ sh setup-fedora.sh && sh setup-config.sh


## Contributing
If you have any suggestions, please feel free to
[file an issue](https://github.com/jcmdln/config/issues) or
[submit a pull request](https://github.com/jcmdln/config/pulls) with
your changes. I'm always looking for improvements.
