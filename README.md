# Bob Embedded Example

[![Build Status](https://ci.bobbuildtool.dev/jenkins/buildStatus/icon?job=example-embedded-demo__linux_freertos)](https://ci.bobbuildtool.dev/jenkins/view/Embedded%20example/job/example-embedded-demo__linux_freertos/)

This repository uses the [basement](https://github.com/BobBuildTool/basement)
recipe layer to build both a small Linux image and a FreeRTOS based image in one
project that share a common "echo" library that replies to your input. It's
meant as an example on how to use Bob to build multi-image code-sharing projects
to ensure API and ABI compatibility in heterogeneous and complex environments
with ease.

For more information about recipe layers and Bob's usage in general see [its
documentation](https://bob-build-tool.readthedocs.io/en/latest/index.html). If
you're interested in building containers and virtual machine images with Bob,
head over to the [container
example](https://github.com/BobBuildTool/bob-example-containers).

# Prerequisites

* A `x86_64` system with the regular development tools installed (GCC, make,
  Perl, ...)
* [Bob Build Tool](https://github.com/BobBuildTool/bob)
* Patience :coffee:

To actually run the built example you'll also need QEMU.

# How to build

Clone the recipes and build them with Bob:

    $ git clone https://github.com/BobBuildTool/bob-example-embedded.git \
	    --recurse-submodules
    $ cd bob-example-embedded
    $ bob build demo::linux+freertos

# How to use

Just execute `run.sh` in the result (something like
`./work/demo/linux+freertos/dist/1/workspace/` but the number might differ)
directory. It will start the Linux system and you can interact with the FreeRTOS
system via `microcom`. Follow the instructions on the console. Both systems are
started in parallel. The UART of the FreeRTOS system is connected to `ttyAMA1`
in the Linux system.

# Contributions

Contributions are welcome in form of feedback, bug reports and code. If you want
to contribute in the form of code but are unsure about how to do things exactly,
feel free to open up a pull request and ask for help.
