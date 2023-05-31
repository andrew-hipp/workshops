# Workshop files for Goettingen 2023

_** Under construction **_

Files in this folder are for a short R coding workshop I taught (am teaching) as a Fulbright Specialist at University of Goettingen in June 2023. You can use R for this workshop in any way you want to, whether on the command-line or in an IDE such as RStudio. In this case, you will use the tutorials as static documents that you read through and code from. If you are doing so, I recommend using an external Jupyter notebook such as [nbviewer](https://nbviewer.org/).


They were written using Jupyter, mostly using the Linux subsystem for Windows. Important to know? Maybe not, but some workshop students may be doing the same, so here is how I set up my system in case you're interested. I do not recommend using the windows Anaconda navigator, which I have mainly found to be a clunky pain in the neck. But if you like it and it works for you, more power to you. Stick with it.

If you are working in Linux, life is easier; just skip step 1 below. 

1. Install WSL on your computer. I chose the Ubuntu option, but I don't think it matters. Launch the linux terminal, do the updates (`sudo apt update`) and upgrades (`sudo apt upgrade`), and you should be set to roll.
2. Install anaconda. I recommend using the conda-forge install with mamba support for package management (this [link](https://github.com/conda-forge/miniforge#mambaforge)). Mamba is in fact a re-implmentation of conda in C++, and it runs smoother and faster than conda. If you are using WSL, you follow the guidelines in this link within the Linux prompt. Throughout, I'll assume you are using Linux.
3. Install R. Once you have conda installed, you will use it for almost all other software installation. Assuming you have done the mamba install as recommended above, I believe you'll default to using conda-forge for installation, which is good: that's where the latest versions of R are available.
