# NST
Normalized Stochasticity Ratio in community assembly (Latest version 3.1.3)

Daliang Ning
- Downloaded **15,515** times from 2019.6.15 to 2022.4.9.
- Recommendation: [iCAMP (assessment of different community assembly processes)](https://github.com/DaliangNing/iCAMP1)
## News
- 2022.4.10 NST v3.1.9 uploaded to CRAN.
- 2021.5.11 NST v3.1.3 updated, adding options to specify occurrence frequency in the regional pool. 
- 2021.4.18 NST v3.1.2 updated on [github](https://github.com/DaliangNing/NST/tree/master/RPackage/AllVersions), to allow relative abundances in community matrix and community data transformation.
- 2021.4.1 Frontiers in Microbilogy opens a research topic [**Community Assembly Mechanisms Shaping Microbiome Spatial or Temporal Dynamics**](https://www.frontiersin.org/research-topics/20916/).
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
-	Kuang J, Bates CT, Wan X, Ning D, Deng D, Shu W, and Zhou J. 2021. High historical variability weakens the effects of current climate differentiation on microbial community dissimilarity and assembly. **Global Change Biology** 27, 5963-5975. https://doi.org/10.1111/gcb.15848.
-	Ning D, Yuan M, Wu L, Zhang Y, Guo X, Zhou X, Yang Y, Arkin AP, Firestone MK, and Zhou J. A quantitative framework reveals ecological drivers of grassland microbial community assembly in response to warming. **Nature Communications** 11, 4717 (2020) [doi:10.1038/s41467-020-18560-z](https://doi.org/10.1038/s41467-020-18560-z).
-	Liang Y, Ning D, Lu Z, Zhang N, Hale L, Wu L, Clark IM, McGrath SP, Storkey J, Hirsch PR, Sun B, and Zhou J. 2020. Century long fertilization reduces stochasticity controlling grassland microbial community succession. **Soil Biology and Biochemistry** 151, 108023. https://doi.org/10.1016/j.soilbio.2020.108023.
-	Ning D, Deng Y, Tiedje JM, and Zhou J. A General Framework for Quantitatively Assessing Ecological Stochasticity. **Proceedings of the National Academy of Sciences of the United States of America** 116, 16892-16898 (2019) [doi:10.1073/pnas.1904623116](https://doi.org/10.1073/pnas.1904623116).
-	Wu L, Ning D, Zhang B, Li Y, Zhang P, Shan X, Zhang Q, Global Water Microbiome Consortium, et al. Global diversity and biogeography of bacterial communities in wastewater treatment plants. **Nature Microbiology** 4, 1183-1195 (2019) [doi:10.1038/s41564-019-0426-5](https://doi.org/10.1038/s41564-019-0426-5).
- Guo X, Feng J, Shi Z, Zhou X, Yuan M, Tao X, Hale L, Yuan T, Wang J, Qin Y, Zhou A, Fu Y, Wu L, He Z, Van Nostrand JD, Ning D, Liu X, Luo Y, Tiedje JM, Yang Y, and Zhou J. Climate warming leads to divergent succession of grassland microbial communities. **Nature Climate Change** 8, 813-818 (2018) [doi:10.1038/s41558-018-0254-2](https://doi.org/10.1038/s41558-018-0254-2).
- Zhou J, Deng Y, Zhang P, Xue K, Liang Y, Van Nostrand JD, Yang Y, He Z, Wu L, Stahl DA, Hazen TC, Tiedje JM, and Arkin AP. Stochasticity, succession, and environmental perturbations in a fluidic ecosystem. **Proceedings of the National Academy of Sciences** 111, E836-E845 (2014) [doi:10.1073/pnas.1324044111](https://doi.org/10.1073/pnas.1324044111).

### Other examples
#### 2022
- Romdhane S, Spor A, Aubert J, Bru D, Breuil M-C, Hallin S, Mounier A, Ouadah S, Tsiknia M, and Philippot L. 2022. Unraveling negative biotic interactions determining soil microbial community assembly and functioning. **The ISME Journal** 16, 296-306. https://doi.org/10.1038/s41396-021-01076-9.
- Thom C, Smith CJ, Moore G, Weir P, and Ijaz UZ. 2022. Microbiomes in drinking water treatment and distribution: A meta-analysis from source to tap. **Water Research** 212, 118106. https://doi.org/10.1016/j.watres.2022.118106.
- Liu S, Chen Q, Li J, Li Y, Zhong S, Hu J, Cai H, Sun W, and Ni J. 2022. Different spatiotemporal dynamics, ecological drivers and assembly processes of bacterial, archaeal and fungal communities in brackish-saline groundwater. **Water Research** 214, 118193. https://doi.org/10.1016/j.watres.2022.118193.
#### 2021
- Liu W, Liu L, Yang X, Deng M, Wang Z, Wang P, Yang S, Li P, Peng Z, Yang L, and Jiang L. 2021. Long-term nitrogen input alters plant and soil bacterial, but not fungal beta diversity in a semiarid grassland. **Global Change Biology** 27, 3939-3950. https://doi.org/10.1111/gcb.15681.
- Fort T, Pauvert C, Zanne AE, Ovaskainen O, Caignard T, Barret M, Compant S, Hampe A, Delzon S, and Vacher C. 2021. Maternal effects shape the seed mycobiome in Quercus petraea. **New Phytologist** 230, 1594-1608. https://doi.org/10.1111/nph.17153.
-	Guo J, Ling N, Li Y, Li K, Ning H, Shen Q, Guo S, and Vandenkoornhuyse P. 2021. Seed-borne, endospheric and rhizospheric core microbiota as predictors of plant functional traits across rice cultivars are dominated by deterministic processes. **New Phytologist** 230, 2047-2060. https://doi.org/10.1111/nph.17297.
- Zhou L, Zhou Y, Tang X, Zhang Y, Jang K-S, Székely AJ, and Jeppesen E. 2021. Resource aromaticity affects bacterial community successions in response to different sources of dissolved organic matter. **Water Research** 190, 116776. https://doi.org/10.1016/j.watres.2020.116776.
- Wang A, Shi K, Ning D, Cheng H, Wang H, Liu W, Gao S, Li Z, Han J, Liang B, and Zhou J. 2021. Electrical selection for planktonic sludge microbial community function and assembly. **Water Research** 206, 117744. https://doi.org/https://doi.org/10.1016/j.watres.2021.117744.
- Zhang L, Yin W, Wang C, Zhang A, Zhang H, Zhang T, and Ju F. 2021. Untangling Microbiota Diversity and Assembly Patterns in the World's Largest Water Diversion Canal. **Water Research** 204, 117617. https://doi.org/10.1016/j.watres.2021.117617.
- Zhang J, Chen Y, Huo Y, Guo J, Wan L, Lu Z, Wu QL, Jeppesen E, Han B-P, and Ren L. 2021. Eutrophication increases deterministic processes and heterogeneity of co-occurrence networks of bacterioplankton metacommunity assembly at a regional scale in tropical coastal reservoirs. **Water Research** 202, 117460. https://doi.org/10.1016/j.watres.2021.117460.
- Niederdorfer R, Fragner L, Yuan L, Hausherr D, Wei J, Magyar P, Joss A, Lehmann MF, Ju F, and Bürgmann H. 2021. Distinct growth stages controlled by the interplay of deterministic and stochastic processes in functional anammox biofilms. **Water Research** 200, 117225. https://doi.org/10.1016/j.watres.2021.117225.
#### 2020
-	Qiu L, Fang W, He H, Liang Z, Zhan Y, Lu Q, Liang D, He Z, Mai B, and Wang S. Organohalide-Respiring Bacteria in Polluted Urban Rivers Employ Novel Bifunctional Reductive Dehalogenases to Dechlorinate Polychlorinated Biphenyls and Tetrachloroethene. **Environmental Science & Technology**![Uploading image.png…]()
 54, 8791-8800 (2020) https://doi.org/10.1021/acs.est.0c01569.
- Zhou L, Liu L, Chen W-Y, Sun J-J, Hou S-W, Kuang T-X, Wang W-X, and Huang X-D. Stochastic determination of the spatial variation of potentially pathogenic bacteria communities in a large subtropical river. Environmental Pollution 264, 114683 (2020) https://doi.org/10.1016/j.envpol.2020.114683.
- Li P, Li W, Dumbrell AJ, Liu M, Li G, Wu M, Jiang C, and Li Z. Spatial Variation in Soil Fungal Communities across Paddy Fields in Subtropical China. mSystems 5, e00704-00719 (2020) https://doi.org/10.1128/mSystems.00704-19.
-	Li L, Ning D, Jeon Y, Ryu H, Santo Domingo JW, Kang D-W, Kadudula A, and Seo Y. Ecological insights into assembly processes and network structures of bacterial biofilms in full-scale biologically active carbon filters under ozone implementation. Science of The Total Environment 751, 141409 (2021) https://doi.org/10.1016/j.scitotenv.2020.141409.
-	Ji M, Kong W, Stegen J, Yue L, Wang F, Dong X, Cowan DA, and Ferrari BC. Distinct assembly mechanisms underlie similar biogeographical patterns of rare and abundant bacteria in Tibetan Plateau grassland soils. Environmental Microbiology 22, 2261-2272 (2020) https://doi.org/10.1111/1462-2920.14993.
-	Ma Z. Testing the Anna Karenina Principle in Human Microbiome-Associated Diseases. iScience 23, 101007 (2020) https://doi.org/10.1016/j.isci.2020.101007.
-	Ma Z. Critical Network Structures and Medical Ecology Mechanisms Underlying Human Microbiome-Associated Diseases. iScience 23, 101195 (2020) https://doi.org/10.1016/j.isci.2020.101195.
-	Tai X, Li R, Zhang B, Yu H, Kong X, Bai ZH, Deng Y, Jia L, and Jin DC. Pollution Gradients Altered the Bacterial Community Composition and Stochastic Process of Rural Polluted Ponds. Microorganisms 8 (2020) https://doi.org/10.3390/microorganisms8020311.
-	Silva MOD and Pernthaler J. Biomass addition alters community assembly in ultrafiltration membrane biofilms. Scientific Reports 10, 11552 (2020) https://doi.org/10.1038/s41598-020-68460-x.

## End
