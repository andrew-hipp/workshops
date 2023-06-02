# Workshop files for Goettingen 2023

_** Under construction **_

Files in this folder are for a short R coding workshop I taught (am teaching) as a Fulbright Specialist at University of Goettingen in June 2023. You can use R for this workshop in any way you want to, whether on the command-line or in an IDE such as RStudio. You can use the tutorials in one of two ways. The easiest is to treat them as static documents that you read through, copy from, and code from. If you are doing so, I recommend using an external Jupyter notebook such as [nbviewer](https://nbviewer.org/). Here, for example, is a [link to the R basics notebook in nbviewer](https://nbviewer.org/github/andrew-hipp/workshops/blob/master/2023-goettingen/Wk1-PhyData/2023-00_R-basics.ipynb). You can simply paste the URL to the tutorials into the nbviewer search box, and you'll be set to roll.


Alternatively, you can use Jupyter yourself to work directly with the notebooks. Briefly, and in terms that I understand, Jupyter is a computing environment that integrates a computing kernel (R, Python, or any of [dozens of others](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)) with a [markdown](https://www.markdownguide.org/) editor and a simple web-based interface for accessing and editing files. If you are working in Jupyter, you simply download or clone the github repository, or download individual files, then open them in Jupyter. You'll be able to edit the code blocks, add code blocks, take class notes in markdown, save your work as a Jupyter notebook. This is probably the easiest way to keep your work organized. Which is one of the things Jupyter notebooks are made for.

I wrote these mostly on a Windows laptop, working in the Linux subsystem for Windows. Important to know? Maybe not, but some workshop students may be doing the same, so here is how I set up my system in case you're interested. I do not recommend using Anaconda navigator, which I have mainly found to be a pain in the neck. But if you like it and it works for you, more power to you. Stick with it.

If you are working in Linux, life is easier; just skip step 1 below. 

1. Install WSL on your computer. I chose the Ubuntu option, but I don't think it matters. Launch the linux terminal, do the updates (`sudo apt update`) and upgrades (`sudo apt upgrade`), and you should be set to roll.
2. Install anaconda. I recommend using the conda-forge install with mamba support for package management (this [link](https://github.com/conda-forge/miniforge#mambaforge)). Mamba is in fact a re-implmentation of conda in C++, and it runs smoother and faster than conda. If you are using WSL, you follow the guidelines in this link within the Linux prompt. Throughout, I'll assume you are using Linux.

`curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge-$(uname)-$(uname -m).sh`

3. Create a conda environment for r and jupyter.

`conda create -n rjup`
  
`conda activate rjup`

3. Install R. Once you have conda installed, you will use it for almost all other software installation. Assuming you have done the mamba install as recommended above, I believe you'll default to using conda-forge for installation, which is good: that's where the latest versions of R are available.

`