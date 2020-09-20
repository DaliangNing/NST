# NST analysis example: SimpleOTU
Daliang Ning. 2020.9.20

## 1. System requirements
- Operating systems: Windows, or Mac, or Linux, any versions which can run R (version >= 3.5).
- Dependencis: R (version >=3.5; https://www.r-project.org/), R packages: vegan,parallel,permute,ape,bigmemory,iCAMP.
- NST current version 3.0.4 has been tested on the current development version of R (4.1.0, 2020-8-18 r79041), R 4.0.2, and R 3.5.3. 
- Any required non-standard hardware: No. However, if you calculate pNST for a large dataset (e.g. >20,000 taxa), a server with enough CPU threads (e.g. >=20) is preferred to finish the calculation in reasonable time.

## 2. Installation guide
- Downlaod and install R (https://www.r-project.org/).
- Install NST.
  - Install published NST: Open R, use function "install.packages" as below.    
  ```
  install.packages("NST")
  ```
  - Install from source file:
    - Download an NST version from this repository NST/RPackage/AllVersions.
    - Open R, install or update following packages: vegan,parallel,permute,ape,bigmemory,iCAMP.
    ```
    install.packages(c("vegan", "permute", "ape", "bigmemory", "iCAMP"))
    ```   
    - In R, click Packages/install package from local file, then select the file. For windows, select the .zip file. For Mac/Linux, select the .gz file. Alternatively, in Linux sytem, if you open R in a terminal, use following command to install from the .gz file (revise "/Path/to/the/folder" to the real path of the .gz file on your computer, revise "xxx" to the version number of NST):
    ```
    install.packages(pkgs="/Path/to/the/folder/NST_xxx.tar.gz", repos = NULL, type="source")
    ```
- The whole installation typically takes several minutes. Usually, <5 min for R installation, <1 min for the NST package, <5 min for installation of other packages.

## 3. Instructions for use
- Before analyze your own data with NST, you may go through a simple example dataset in the folder /Examples/SimpleOTU.
- When analyzing your own data, check the format of the example data files (community.csv, tree.nwk, treatment.csv) in the folder "SimpleOTU". Revise your data files to the same format.
- Change the folder paths and file names in the "NST.example.r" to your data as indicated. 
- Change parameter settings (e.g. nworker, the thread number for parallel computing) according to your need. You may check the help document of each function for detailed explanation.
- Run the codes and check the output files in the output folder you've specified. You may check the help documents in the R package for details.
