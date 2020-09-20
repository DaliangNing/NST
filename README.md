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

## Publication
[1]	Ning D, Deng Y, Tiedje JM, and Zhou J. A General Framework for Quantitatively Assessing Ecological Stochasticity. Proceedings of the National Academy of Sciences of the United States of America 116, 16892-16898 (2019) [doi:10.1073/pnas.1904623116](https://doi.org/10.1073/pnas.1904623116).
