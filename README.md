# NST
Normalized Stochasticity Ratio in community assembly (Latest version 3.0.6)

Daliang Ning
- Downloaded **9824** times from 2019.6.15 to 2021.4.17.
- Recommendation: [iCAMP (assessment of different community assembly processes)](https://github.com/DaliangNing/iCAMP1)
## News
- 2021.4.18 NST v3.1.2 updated on [github](https://github.com/DaliangNing/NST/tree/master/RPackage/AllVersions), to allow relative abundances in community matrix and community data transformation.
- 2021.1.8 NST v3.0.6 updated on CRAN; fixed some bugs and updated github link and references.
- 2020.9.20 set up GitHub repository for NST package. Different versions and an example are uploaded.
- 2020.9.16 [NST v3.0.3](https://cran.r-project.org/web/packages/NST) is published on CRAN. Phylogentic NST is added.
- 2019.8.20 The paper about NST framework development is published on PNAS ([Ning et al 2019 PNAS](https://doi.org/10.1073/pnas.1904623116)).
- 2019.6.15 NST v2.0.3 is published on CRAN.

## Key functions in NST package
The following indexes can be find in the output of function tNST or pNST.
- [**tNST**](https://doi.org/10.1073/pnas.1904623116): Taxonomic Normalized Stochasticity Ratio ([Ning et al 2019 PNAS](https://doi.org/10.1073/pnas.1904623116))
- [**pNST**](https://doi.org/10.1038/s41467-020-18560-z): Phylogenetic Normalized Stochasticity Ratio ([Ning et al 2020 Nat Commun](https://doi.org/10.1038/s41467-020-18560-z))
- [**MST**](https://doi.org/10.1101/638908): Modified Stochasticity Ratio (a special form of Normalized Stochasticity Ratio) ([Liang et al 2019 bioRxiv](https://doi.org/10.1101/638908))
- [**ST**](https://doi.org/10.1073/pnas.1324044111): Stochasticity Ratio (not normalized) ([Zhou et al 2014 PNAS](https://doi.org/10.1073/pnas.1324044111))
- [**SES/betaNTI/betaNRI**](https://doi.org/10.1093/bioinformatics/btn358): Standard Effect Size based on null model analysis of taxonomic (e.g. [Kraft et al 2011 Science](https://doi.org/10.1126/science.1208584)) or phylogenetic beta diversity (e.g. betaNRI, betaNTI; [Webb & Kembel 2008 Bioinformatics](https://doi.org/10.1093/bioinformatics/btn358); [Stegen et al 2012 ISME J](https://doi.org/10.1038/ismej.2012.22)).
- [**RC**](https://doi.org/10.1890/ES10-00117.1): Modified Raup-Crick index based on unweighted (RCjaccard; [Chase et al 2011 Ecosphere](https://doi.org/10.1890/ES10-00117.1)) or weighted taxonomic beta diversity (RCbray; [Stegen et al 2013 ISME J](https://doi.org/10.1038/ismej.2013.93)).
- **Taxonomic beta diversity indexes**: "manhattan", "euclidean", "canberra", "bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn", "mountford", "raup" , "binomial", "chao", "cao", "mahalanobis", "mGower", "mEuclidean", "mManhattan", "chao.jaccard", "chao.sorensen", using function vegdist and designdist from package [vegan](https://cran.r-project.org/web/packages/vegan) and function for chao.jaccard and chao.sorensen from package [fossil](https://cran.r-project.org/web/packages/fossil).
- **Phylogenetic beta diversity**: beta mean nearest taxon distance (betaMNTD; [Webb & Kembel 2008 Bioinformatics](https://doi.org/10.1093/bioinformatics/btn358)).
- **Null model algorithms**: various null model algorithms including many different ways to contrain richness, occurrance frequency, and abundance ([Gotelli 2000 Ecology](https://doi.org/10.1890/0012-9658(2000)081[2606:NMAOSC]2.0.CO;2); [Webb & Kembel 2008 Bioinformatics](https://doi.org/10.1093/bioinformatics/btn358); [Stegen et al 2013 ISME J](https://doi.org/10.1038/ismej.2013.93)); plus 'taxa shuffle' ([Kembel 2009 Ecol Lett](https://doi.org/10.1111/j.1461-0248.2009.01354.x)), which is specific to phylogenetic metrics.

## How to use
### System requirements
- Operating systems: Windows, or Mac, or Linux, any versions which can run R (version >= 3.5).
- Dependencis: R (version >=3.5; https://www.r-project.org/), R packages: vegan,parallel,permute,ape,bigmemory,iCAMP.
- NST current version 3.0.4 has been tested on the current development version of R (4.1.0, 2020-8-18 r79041), R 4.0.2, and R 3.5.3. 
- Any required non-standard hardware: No. However, if you calculate pNST for a large dataset (e.g. >20,000 taxa), a server with enough CPU threads (e.g. >=20) is preferred to finish the calculation in reasonable time.

### Installation guide
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

### Instructions for use
- Before analyze your own data with NST, you may go through a simple example dataset in the folder /Examples/SimpleOTU.
- When analyzing your own data, check the format of the example data files (community.csv, tree.nwk, treatment.csv) in the folder "SimpleOTU". Revise your data files to the same format.
- Change the folder paths and file names in the "NST.example.r" to your data as indicated. 
- Change parameter settings (e.g. nworker, the thread number for parallel computing) according to your need. You may check the help document of each function for detailed explanation.
- Run the codes and check the output files in the output folder you've specified. You may check the help documents in the R package for details.

## Publications
### Our studies
-	Ning D, Yuan M, Wu L, Zhang Y, Guo X, Zhou X, Yang Y, Arkin AP, Firestone MK, and Zhou J. A quantitative framework reveals ecological drivers of grassland microbial community assembly in response to warming. **Nature Communications** 11, 4717 (2020) [doi:10.1038/s41467-020-18560-z](https://doi.org/10.1038/s41467-020-18560-z).
-	Ning D, Deng Y, Tiedje JM, and Zhou J. A General Framework for Quantitatively Assessing Ecological Stochasticity. **Proceedings of the National Academy of Sciences of the United States of America** 116, 16892-16898 (2019) [doi:10.1073/pnas.1904623116](https://doi.org/10.1073/pnas.1904623116).
- Liang Y, Ning D, Lu Z, Zhang N, Hale L, Wu L, Clark IM, McGrath SP, Storkey J, Hirsch PR, Sun B, and Zhou J. Century long fertilization reduces stochasticity controlling grassland microbial community succession. **bioRxiv** (2019) [doi:10.1101/638908](https://doi.org/10.1101/638908).
- Guo X, Feng J, Shi Z, Zhou X, Yuan M, Tao X, Hale L, Yuan T, Wang J, Qin Y, Zhou A, Fu Y, Wu L, He Z, Van Nostrand JD, Ning D, Liu X, Luo Y, Tiedje JM, Yang Y, and Zhou J. Climate warming leads to divergent succession of grassland microbial communities. **Nature Climate Change** 8, 813-818 (2018) [doi:10.1038/s41558-018-0254-2](https://doi.org/10.1038/s41558-018-0254-2).
-	Wu L, Ning D, Zhang B, Li Y, Zhang P, Shan X, Zhang Q, Global Water Microbiome Consortium, et al. Global diversity and biogeography of bacterial communities in wastewater treatment plants. **Nature Microbiology** 4, 1183-1195 (2019) [doi:10.1038/s41564-019-0426-5](https://doi.org/10.1038/s41564-019-0426-5).
- Zhou J, Deng Y, Zhang P, Xue K, Liang Y, Van Nostrand JD, Yang Y, He Z, Wu L, Stahl DA, Hazen TC, Tiedje JM, and Arkin AP. Stochasticity, succession, and environmental perturbations in a fluidic ecosystem. **Proceedings of the National Academy of Sciences** 111, E836-E845 (2014) [doi:10.1073/pnas.1324044111](https://doi.org/10.1073/pnas.1324044111).

### Other examples
-	Qiu L, Fang W, He H, Liang Z, Zhan Y, Lu Q, Liang D, He Z, Mai B, and Wang S. Organohalide-Respiring Bacteria in Polluted Urban Rivers Employ Novel Bifunctional Reductive Dehalogenases to Dechlorinate Polychlorinated Biphenyls and Tetrachloroethene. Environmental Science & Technology 54, 8791-8800 (2020) https://doi.org/10.1021/acs.est.0c01569.
- Zhou L, Liu L, Chen W-Y, Sun J-J, Hou S-W, Kuang T-X, Wang W-X, and Huang X-D. Stochastic determination of the spatial variation of potentially pathogenic bacteria communities in a large subtropical river. Environmental Pollution 264, 114683 (2020) https://doi.org/10.1016/j.envpol.2020.114683.
- Li P, Li W, Dumbrell AJ, Liu M, Li G, Wu M, Jiang C, and Li Z. Spatial Variation in Soil Fungal Communities across Paddy Fields in Subtropical China. mSystems 5, e00704-00719 (2020) https://doi.org/10.1128/mSystems.00704-19.
-	Li L, Ning D, Jeon Y, Ryu H, Santo Domingo JW, Kang D-W, Kadudula A, and Seo Y. Ecological insights into assembly processes and network structures of bacterial biofilms in full-scale biologically active carbon filters under ozone implementation. Science of The Total Environment 751, 141409 (2021) https://doi.org/10.1016/j.scitotenv.2020.141409.
-	Ji M, Kong W, Stegen J, Yue L, Wang F, Dong X, Cowan DA, and Ferrari BC. Distinct assembly mechanisms underlie similar biogeographical patterns of rare and abundant bacteria in Tibetan Plateau grassland soils. Environmental Microbiology 22, 2261-2272 (2020) https://doi.org/10.1111/1462-2920.14993.
-	Ma Z. Testing the Anna Karenina Principle in Human Microbiome-Associated Diseases. iScience 23, 101007 (2020) https://doi.org/10.1016/j.isci.2020.101007.
-	Ma Z. Critical Network Structures and Medical Ecology Mechanisms Underlying Human Microbiome-Associated Diseases. iScience 23, 101195 (2020) https://doi.org/10.1016/j.isci.2020.101195.
-	Tai X, Li R, Zhang B, Yu H, Kong X, Bai ZH, Deng Y, Jia L, and Jin DC. Pollution Gradients Altered the Bacterial Community Composition and Stochastic Process of Rural Polluted Ponds. Microorganisms 8 (2020) https://doi.org/10.3390/microorganisms8020311.
-	Silva MOD and Pernthaler J. Biomass addition alters community assembly in ultrafiltration membrane biofilms. Scientific Reports 10, 11552 (2020) https://doi.org/10.1038/s41598-020-68460-x.
-	Cheaib B, Seghouani H, Llewellyn MS, Vandal-Lenghan K, Mercier P-L, and Derome N. The yellow perch (Perca flavescens) microbiome revealed resistance to colonisation mostly associated with neutralism driven by rare taxa under cadmium disturbance. Research Square (2020) https://doi.org/10.21203/rs.3.rs-52321/v1.
-	Chen Q-L, Hu H-W, Yan Z-Z, Li C-Y, Nguyen B-AT, Cui H-L, Zheng Y, Zhu Y-G, and He J-Z. Deterministic Selection Dominates Microbial Community Assembly in Termite Mounds Across a Large Spatial Area. Research Square (2020) https://doi.org/10.21203/rs.3.rs-34782/v1.
-	Zhang Z, Li H-Y, Wang H, Tao X-H, Wang X-Z, Jin W-Z, Chen H, Gilbert J, and Zhu Y-G. Continental-Scale Paddy Soil Bacterial Community Structure, Function and Biotic Interaction. Research Square (2020) https://doi.org/10.21203/rs.3.rs-37103/v1.
-	Zheng W, Zhao Z, Lv F, Yin Y, Wang Z, Zhao Z, Li Z, and Zhai B. Fungal alpha-diversity drives the stochasticity of bacterial and fungal community assembly in soil aggregates in the apple orchard. Research Square (2020) https://doi.org/10.21203/rs.3.rs-56672/v1.
-	Niederdorfer R, Fragner L, Yuan L, Hausherr D, Wei J, Magyar P, Joss A, Ju F, and Bürgmann H. Distinct growth stages shaped by an interplay of deterministic and neutral processes are indispensable for functional anammox biofilms. bioRxiv, 2020.2006.2003.131896 (2020) https://doi.org/10.1101/2020.06.03.131896.






