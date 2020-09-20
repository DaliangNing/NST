# NST
Normalized Stochasticity Ratio in community assembly

Daliang Ning 2020.9.20

## News
2020.9.20 set up GitHub repository for NST package. Different versions and an example are uploaded.
2020.9.16 [NST v3.0.3](https://cran.r-project.org/web/packages/NST) is published on CRAN. Phylogentic NST is added.

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

## Publications
-	Ning D, Yuan M, Wu L, Zhang Y, Guo X, Zhou X, Yang Y, Arkin AP, Firestone MK, and Zhou J. A quantitative framework reveals ecological drivers of grassland microbial community assembly in response to warming. **Nature Communications** 11, 4717 (2020) [doi:10.1038/s41467-020-18560-z](https://doi.org/10.1038/s41467-020-18560-z).
-	Ning D, Deng Y, Tiedje JM, and Zhou J. A General Framework for Quantitatively Assessing Ecological Stochasticity. **Proceedings of the National Academy of Sciences of the United States of America** 116, 16892-16898 (2019) [doi:10.1073/pnas.1904623116](https://doi.org/10.1073/pnas.1904623116).
- Liang Y, Ning D, Lu Z, Zhang N, Hale L, Wu L, Clark IM, McGrath SP, Storkey J, Hirsch PR, Sun B, and Zhou J. Century long fertilization reduces stochasticity controlling grassland microbial community succession. **bioRxiv** (2019) [doi:10.1101/638908](https://doi.org/10.1101/638908).
- Guo X, Feng J, Shi Z, Zhou X, Yuan M, Tao X, Hale L, Yuan T, Wang J, Qin Y, Zhou A, Fu Y, Wu L, He Z, Van Nostrand JD, Ning D, Liu X, Luo Y, Tiedje JM, Yang Y, and Zhou J. Climate warming leads to divergent succession of grassland microbial communities. **Nature Climate Change** 8, 813-818 (2018) [doi:10.1038/s41558-018-0254-2](https://doi.org/10.1038/s41558-018-0254-2).
-	Wu L, Ning D, Zhang B, Li Y, Zhang P, Shan X, Zhang Q, Global Water Microbiome Consortium, et al. Global diversity and biogeography of bacterial communities in wastewater treatment plants. **Nature Microbiology** 4, 1183-1195 (2019) [doi:10.1038/s41564-019-0426-5](https://doi.org/10.1038/s41564-019-0426-5).
- Zhou J, Deng Y, Zhang P, Xue K, Liang Y, Van Nostrand JD, Yang Y, He Z, Wu L, Stahl DA, Hazen TC, Tiedje JM, and Arkin AP. Stochasticity, succession, and environmental perturbations in a fluidic ecosystem. **Proceedings of the National Academy of Sciences** 111, E836-E845 (2014) [doi:10.1073/pnas.1324044111](https://doi.org/10.1073/pnas.1324044111).




