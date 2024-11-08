# Workshop files for Goettingen 2023
_created: 2023-06-02_  
_updated: 2024-11-04_ (updating from mambaforge to miniforge)  
Full R workshop overview [linked here](https://docs.google.com/document/d/1NkPN9qkc4AePf_6c1tbCn6E6Im17yygLOKD7UfA-3dY/edit?usp=sharing)

Files in this folder are for a short R coding workshop I taught (am teaching) as a Fulbright Specialist at University of Goettingen in June 2023. You can use R for this workshop in any way you want to, whether on the command-line or in an IDE such as RStudio. You can use the tutorials in one of two ways. 

## Using notebooks as static documents
The easiest option is to treat the notebooks as static documents that you read through, copy from, and code from. If you are doing so, please be aware that they do not at this time render correctly in GitHub (2023-06-04). You should view them using an external Jupyter notebook such as [nbviewer](https://nbviewer.org/). Here, for example, is a [link to the R basics notebook in nbviewer](https://nbviewer.org/github/andrew-hipp/workshops/blob/master/2023-goettingen/Wk1-PhyData/2023-00_R-basics.ipynb). You can simply paste the URL to the tutorials into the nbviewer search box, and you'll be set to roll.

## Computing in Jupyter
Alternatively, you can use Jupyter yourself to work directly with the notebooks. Briefly, and in terms that I understand, Jupyter is a computing environment that integrates a computing kernel (R, Python, or any of [dozens of others](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)) with a [markdown](https://www.markdownguide.org/) editor and a simple web-based interface for accessing and editing files. If you are working in Jupyter, you simply download or clone the github repository, or download individual files, then open them in Jupyter. You'll be able to edit the code blocks, add code blocks, take class notes in markdown, save your work as a Jupyter notebook. This is probably the easiest way to keep your work organized. Which is one of the things Jupyter notebooks are made for.

I wrote these mostly on a Windows laptop, working in the Linux subsystem for Windows. Important to know? Maybe not, but some workshop students may be doing the same, so here is how I set up my system in case you're interested. I do not recommend using Anaconda navigator, which I have mainly found to be a pain in the neck. But if you like it and it works for you, more power to you. Stick with it.

If you are working in Linux, life is easier; just skip step 1 below. 

1. Install WSL 2 on your computer (instructions [here](https://learn.microsoft.com/en-us/windows/wsl/install)). The Ubuntu distributon will install automatically, but if you don't like this, you can change it. I don't think it matters. Launch the linux terminal, do the updates (`sudo apt update`) and upgrades (`sudo apt upgrade`), and you should be set to roll.
2. Install anaconda. I recommend using the conda-forge install with mamba support for package management (this [link](https://github.com/conda-forge/miniforge)). Mamba is in fact an implementation of conda in C++, and it runs smoother and faster than conda. (** 2024-11-04; mambaforge has been deprecated, so initial installation now uses miniforge.) If you are using WSL, you follow the guidelines in this link within the Linux prompt. Throughout, I'll assume you are using Linux.

```
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
```

3. Exit your shell using `exit`, then restart. Create a conda environment for r and jupyter, then activate it.

```
conda create -n rjup && conda activate rjup
```

4. Install Jupyter notebooks. Note that you can do this with pip instead of conda. I don't know whether there are real advantages either way.

```
mamba install -c conda-forge notebook
```

5. Install R. Note that you will find other advice the latest versions of R are available.

```
mamba install -c conda-forge r-base
```

6. Install IRkernel. This is the Kernel you need to get R and Jupyter talking with one another.

```
mamba install -c conda-forge r-irkernel
```

7. Initialize IRkernel. For this, you need to open R by simply typing `R` on the command line within your conda environment. Within R, you then type:

```
IRkernel:::installspec()
```

... let it do its thing, then close R:

```
q()
```

Now you are up and running! You can launch a jupyter notebook by typing:

```
jupyter notebook
```

... then opening any of the links you see. A browser will launch, and the fun begins.

8. Optional but recommended: install R libraries you need from within conda. Installing these within R (using `install.packages()`) goes really slowly. The conda builds for these packages are nice. Here are the ones I recommend for starting in this workshop:

```
 mamba install -c conda-forge r-ape r-geiger r-phytools r-vegan
```

The following lines are for ggtree, which I've found to be a fussy install. First install the conda-forge dependencies manually: 

```
mamba install -c conda-forge r-aplot r-tidyverse r-tidytree
```

... then the bioconda packages:

``` 
mamba install -c bioconda bioconductor-treeio bioconductor-ggtree
```

And you should be done! All set to code and document code in Jupyter notebooks.

## working in WSL
I initially had file permission issues using WSL. I recommend two approaches:
  * access files using \\wsl$\... instead of c:/users/... -- the former seems to deal with permissions correctly.
  * install and launch Visual Studio Code or whatever code editor you are using from within WSL. Running `code .` from within the working directory launches the application to run in WSL. For more information, see [docs on Visual Studio Code site](https://code.visualstudio.com/docs/remote/wsl).
