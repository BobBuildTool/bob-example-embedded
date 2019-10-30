# Bob embedded example

This repository uses the [basement](https://github.com/BobBuildTool/basement)
recipes to build a small Linux system and a FreeRTOS based system in one
project. Both systems share a common "echo" library that replies to your input.

[![Build Status](https://ci.bobbuildtool.dev/jenkins/buildStatus/icon?job=example-embedded-demo__linux_freertos)](https://ci.bobbuildtool.dev/jenkins/view/Embedded%20example/job/example-embedded-demo__linux_freertos/)

# Prerequisites

* A x86_64 system with the regular development tools installed (gcc, make,
  perl, ...)
* Bleeding edge Bob Build Tool (https://github.com/BobBuildTool/bob)
* Patience

# How to build

Clone the recipes and build them with Bob:

    $ git clone https://github.com/BobBuildTool/bob-example-embedded.git \
	    --recurse-submodules
    $ bob build demo::linux+freertos

# How to use

Just execute `run.sh` in the result directory. It will start the Linux system
and you can interact with the FreeRTOS system via `microcom`. Follow the
instructions on the console. Both systems are started in parallel. The UART of
the FreeRTOS system is connected to `ttyAMA1` in the Linux system.
