<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

<img src="https://github.com/ZeeWeasel/LogDuck/blob/main/images/icon.png?raw=true" alt="Logo" width="200" height="200">

# LogDuck _for Godot 4_

[![License](https://img.shields.io/github/license/myyk/godot-playlists)](https://github.com/ZeeWeasel/LogDuck/blob/main/LICENSE)
[![GitHub release badge](https://badgen.net/github/release/zeeweasel/logduck)](https://github.com/zeeweasel/logduck/releases/latest)
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/zeeweasel/logduck)](https://img.shields.io/github/languages/code-size/zeeweasel/logduck)



A straight-forward logging addon for Godot 4.x to centralize and manage your Debug output for your project.
<br />

<a href="https://github.com/ZeeWeasel/LogDuck/issues/new?labels=bug&template=bug-report---.md">Report Bug</a> • <a href="https://github.com/ZeeWeasel/LogDuck/issues/new?labels=enhancement&template=feature-request---.md">Request Features</a> • <a href="https://discord.gg/XSWkS2fWJc">Discord Server</a>

</div>

## Installation

* Download the .zip file and extract the LogDuck folder into your addons folder in your Godot Project.<br><br>Inside of LogDuckSettings.gd are all settings to customize how you'd like LogDuck to behave. Every entry has a short explanation what it does. By default LogDuck will push warnings and errors automatically into the Debugger and rich output is enabled. 

* Alternatively, you can take the LogDuck.gd script and drag it into your project, and add it as an autoloaded script. 
Make sure to set it as high as possible in the Load Order, so it can be ready for other autoloaded scripts.

**Note:** You can adjust the desired class name either inside of plugin.gd or inside the autoloaded script list, if you prefer a different way to call the logger. _(Log.d() instead of LogDuck.d() for example)_


### Version

Currently LogDuck supports Godot 4.0.1+ with GDScript. I have yet to look into making sure it plays along nicely with C# scripts. If you'd like to tackle that, feel free to <a href="#contributing">contribute</a>!



## Using LogDuck

By default, LogDuck will output anything sent to LogDuck with d() w() and e() into the output / console, errors and warnings also into the Debugger if you are in the Editor. LogDuck, however, will **not** automatically catch any output sent to print(), printerr() or print_rich() calls. A careful Search and Replace of these functions with LogDuck.d, usually fixes this quickly.

If you need help with the setup, I will try my best to help out on the [Discord server](https://discord.gg/XSWkS2fWJc). If LogDuck is useful for you, please give me a shout on [Twitter](https://twitter.com/zee_weasel)!



## Current Features

- Rich and plain text console formatting fully customizable with BBCode
- Auto-detects names for Autoloaded and other GD scripts with class names
- 3 Logging Levels: Debug, Warning, Error; toggleable
- Logging functions handle up to 6 arguments (7 if the first isn't a String)
- Toggle for last or full stack frame output in console per log level
- Stack frame detail formats customizable as single line or full details
- Warnings and errors pushable to Godot debugger (Editor only)
- Option to pause game on logged errors (Editor/Debug only)
- Option to block BBCode parsing in arguments, for outputs like Rich Text Labels / Chats
- Instance numbering to differentiate logs in the editor output when testing multiple instances
- Print system specs to console (automatically at startup or by calling method)

## Future Work

- Improved documentation (like this README.MD)
- Adjust / Customize LogDuck via Project Settings Menus
- Crash detection for previous session
- Log File Handling
- Output of images into the output when in print_rich mode
- Being fully compatible with C# scripts

See the [open issues](https://github.com/ZeeWeasel/LogDuck/issues) for a full list of proposed features and known issues.

## Contributing

Any contributions you make are **greatly appreciated**. I especially am looking to make this more robust and able to simplify debugging overall with the least amount of setup. Have a look at the planned features, to see if there is something you'd be interested in contributing!


## License

Distributed under the MIT License. See `LICENSE.txt` for more information.


## Contact

[Follow @zee_weasel on Twitter](https://twitter.com/zee_weasel)<br>
[Join Discord Server](https://discord.gg/XSWkS2fWJc)
