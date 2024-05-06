# sleepuntil

Sleep Until is a Bash script that allows you to suspend execution until a specified date and time is reached. It provides a convenient way to schedule tasks or delay actions until a desired moment.

## Requirements

- Bash (Bourne Again Shell)
- Unix-like operating system (Linux, macOS, OpenBSD, ...)

## Installation

1. Clone this repository
2. `chmod +x install.sh` (make it executable)
3. Run `./install.sh`. This will install the script system-wide
4. If your system is not supported for automatic installation, proceed as illustrated by the install script

## Usage

```bash
sleepuntil [-v] <datetime>
```

## Examples

* `sleepuntil -v "tomorrow 9am"`
* `sleepuntil 10pm && execute_evening_task`