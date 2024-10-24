########################
# version 20210511
# version 20241022, add row.names = FALSE to write.table to avoid header error.
# 1 # file and folder path and parameters

wd="NST/Examples/SimpleOTU" # change to folder path in your computer, where the input files are saved
save.wd="NST/Examples/SimpleOTU/TestResult2" # folder path, where to save the output files
com.file="community.csv" # file path of the communty matrix, e.g. OTU table. Each row represents a taxon, and each column represents a sample. Thus, row names are taxon IDs, and column names are sample IDs.
group.file="treatment.csv" # treatment information table. Each row represents a sample.
tree.file="tree.nwk" # phylogenetic tree file in nwk format.

nworker=4 # parallell computing thread number.
rand.time=20 # randomization time for null model analysis. usually set 1000 for real datasets. here use 20 for test.
prefix="Test" # prefix in the output filenames

# 2 # load package
# if you have not installed the package NST, please use following code
# install.packages("NST") # for NST version <=3.0.6
# NST version>3.0.6 need to be installed from files

library(ape)
library(iCAMP)
library(NST) # need to be NST >=3.1.3

# 3 # load data and match IDs
setwd(wd)
comm=t(read.table(com.file,header = TRUE,sep = ",",row.names = 1,as.is = TRUE,stringsAsFactors = FALSE))
group=read.table(group.file,header = TRUE,sep = ",",row.names = 1,as.is = TRUE,stringsAsFactors = FALSE)
tree=ape::read.tree(file = tree.file) # if you have tree

samp.ck=NST::match.name(rn.list=list(comm=comm,group=group))
comm=samp.ck$comm
comm=comm[,colSums(comm)>0,drop=FALSE]
group=samp.ck$group

tax.ck=NST::match.name(cn.list = list(comm=comm),tree.list = list(tree=tree)) # if you have tree
comm=tax.ck$comm
tree=tax.ck$tree

# 4 # Grouping way and metacommunity seting
groupi=group[,1,drop=FALSE] # if you have multiple ways to group samples, select one way each time.
prefixi=paste0(prefix,".Treat") # re-define the prefix in output filenames, specific to the grouping type.
meta.groupi=NULL # if treatment and control are from different metacommunities, you may set meta.groupi=groupi

# 5 # taxonomic NST
# 5.1 # calculate tNST
dist.method="bray" # "jaccard" and "bray" are preferred.
t1=Sys.time() # to count time cost
setwd(save.wd)
tnst=tNST(comm=comm, group=groupi, meta.group=meta.groupi, meta.com=NULL,
          dist.method=dist.method, abundance.weighted=TRUE, rand=rand.time,
          output.rand=TRUE, nworker=nworker, LB=FALSE, null.model="PF",
          between.group=FALSE, SES=TRUE, RC=TRUE)

save(tnst,file = paste0(prefixi,".tNST.rda")) # save tNST output in R data format
write.table(tnst$index.grp,row.names = FALSE,file = paste0(prefixi,".tNST.summary.csv"), quote = FALSE,sep = ",")
write.table(tnst$index.pair.grp,row.names = FALSE,file = paste0(prefixi,".tNST.pairwise.csv"),quote = FALSE,sep = ",")
format(Sys.time()-t1)

# 5.2 # Bootstrapping test
t1=Sys.time()
tnstbt=nst.boot(nst.result=tnst, group=groupi, rand=rand.time, trace=TRUE,
                two.tail=FALSE, out.detail=TRUE, between.group=FALSE, nworker=nworker)
save(tnstbt,file = paste0(prefixi,".tNST.boot.rda"))
write.table(tnstbt$summary,row.names = FALSE,file = paste0(prefixi,".tNST.boot.summary.csv"), quote = FALSE,sep = ",")
write.table(tnstbt$compare,row.names = FALSE,file = paste0(prefixi,".tNST.boot.compare.csv"), quote = FALSE,sep = ",")
(t=format(Sys.time()-t1))

# 5.3 # PERMANOVA
t1=Sys.time()
tnstpaov=nst.panova(nst.result=tnst, group = groupi, rand = rand.time, trace = TRUE)
write.table(tnstpaov,row.names = FALSE,file = paste0(prefixi,".tNST.PERMANOVA.csv"), quote = FALSE,sep = ",")
(t=format(Sys.time()-t1))

# 6 # phylogenetic NST
# 6.1 # phylogentic distance matrix # use bigmemory for big dataset
wd.pd=paste0(save.wd,"/pdbig")
if(!dir.exists(wd.pd)){dir.create(wd.pd)}
setwd(wd.pd)

if(file.exists("pd.desc"))
{
  # if already done before, directly use it.
  pdbig=list()
  pdbig$tip.label=read.table("pd.taxon.name.csv",sep = ",",row.names = 1,header = TRUE,stringsAsFactors = FALSE,as.is = TRUE)[,1]
  pdbig$pd.wd=wd.pd
  pdbig$pd.file="pd.desc"
  pdbig$pd.name.file="pd.taxon.name.csv"
}else{
  pdbig=iCAMP::pdist.big(tree = tree, wd = wd.pd, nworker = nworker)
}

# 6.2 # calculate pNST
t1=Sys.time() # to count time cost
setwd(save.wd)
pnst=NST::pNST(comm=comm, pd.desc=pdbig$pd.file, pd.wd=pdbig$pd.wd,
               pd.spname=pdbig$tip.label, group=groupi, meta.group=meta.groupi,
               abundance.weighted=TRUE, rand=rand.time, output.rand=TRUE,
               taxo.null.model=NULL, phylo.shuffle=TRUE,
               exclude.conspecifics=FALSE, nworker=nworker,
               between.group=FALSE, SES=TRUE, RC=TRUE)
save(pnst,file = paste0(prefixi,".pNST.rda")) # save pNST output in R data format
write.table(pnst$index.grp,row.names = FALSE,file = paste0(prefixi,".pNST.summary.csv"), quote = FALSE,sep = ",")
write.table(pnst$index.pair.grp,row.names = FALSE,file = paste0(prefixi,".pNST.pairwise.csv"),quote = FALSE,sep = ",")
format(Sys.time()-t1)

# 6.3 # Bootstrapping test
t1=Sys.time()
pnstbt=nst.boot(nst.result=pnst, group=groupi, rand=rand.time, trace=TRUE,
                two.tail=FALSE, out.detail=TRUE, between.group=FALSE, nworker=nworker)
save(pnstbt,file = paste0(prefixi,".pNST.boot.rda"))
write.table(pnstbt$summary,row.names = FALSE,file = paste0(prefixi,".pNST.boot.summary.csv"), quote = FALSE,sep = ",")
write.table(pnstbt$compare,row.names = FALSE,file = paste0(prefixi,".pNST.boot.compare.csv"), quote = FALSE,sep = ",")
(t=format(Sys.time()-t1))

# 6.4 # PERMANOVA
t1=Sys.time()
pnstpaov=nst.panova(nst.result=pnst, group = groupi, rand = rand.time, trace = TRUE)
write.table(pnstpaov,row.names = FALSE,file = paste0(prefixi,".pNST.PERMANOVA.csv"), quote = FALSE,sep = ",")
(t=format(Sys.time()-t1))


# 7 # various metacommunity (regional pool) settings
# 7.1 # different groups are from different regional pools
groupi=group[,1,drop=FALSE] # if you have multiple ways to group samples, select one way each time.
prefixi=paste0(prefix,".DifMeta") # re-define the prefix in output filenames, specific to the grouping type.
meta.groupi=group[,1,drop=FALSE] # if treatment and control are from different metacommunities, you may set meta.groupi=groupi

dist.method="bray" 
t1=Sys.time()
setwd(save.wd)
tnst=tNST(comm=comm, group=groupi, meta.group=meta.groupi, meta.com=NULL,
          dist.method=dist.method, abundance.weighted=TRUE, rand=rand.time,
          output.rand=TRUE, nworker=nworker, LB=FALSE, null.model="PF",
          between.group=FALSE, SES=TRUE, RC=TRUE)

save(tnst,file = paste0(prefixi,".tNST.rda")) # save tNST output in R data format
write.table(tnst$index.grp,row.names = FALSE,file = paste0(prefixi,".tNST.summary.csv"), quote = FALSE,sep = ",")
write.table(tnst$index.pair.grp,row.names = FALSE,file = paste0(prefixi,".tNST.pairwise.csv"),quote = FALSE,sep = ",")
format(Sys.time()-t1)

# 7.2 # specify relative abundances in regional pool which are different from the mean relative abundances of observed OTU/ASV table.
groupi=group[,1,drop=FALSE] # if you have multiple ways to group samples, select one way each time.
prefixi=paste0(prefix,".MetaRA") # re-define the prefix in output filenames, specific to the grouping type.
dist.method="bray" 
# as a simple example, here we assume all species have equal relative abundance in the regional pool.
meta.com=matrix(1,nrow=1,ncol=ncol(comm))
colnames(meta.com)=colnames(comm)
t1=Sys.time()
setwd(save.wd)
tnst=tNST(comm=comm, group=groupi, meta.group=NULL, meta.com=meta.com,
          dist.method=dist.method, abundance.weighted=TRUE, rand=rand.time,
          output.rand=TRUE, nworker=nworker, LB=FALSE, null.model="PF",
          between.group=FALSE, SES=TRUE, RC=TRUE)

save(tnst,file = paste0(prefixi,".tNST.rda")) # save tNST output in R data format
write.table(tnst$index.grp,row.names = FALSE,file = paste0(prefixi,".tNST.summary.csv"), quote = FALSE,sep = ",")
write.table(tnst$index.pair.grp,row.names = FALSE,file = paste0(prefixi,".tNST.pairwise.csv"),quote = FALSE,sep = ",")
format(Sys.time()-t1)

# 7.3 # specify relative abundances and occurrence frequency in regional pool
# need NST version >=3.1.3
# as an example, here we assume the control and treat areas are actually the same, but we took different number of samples (uneven sampling)
# so actual relative abunance and occurrence frequency should be calculated as 'mean of means of treatments'
# 7.3.1 # basic settings
groupi=group[,1,drop=FALSE] # if you have multiple ways to group samples, select one way each time.
prefixi=paste0(prefix,".MetaRAFQ") # re-define the prefix in output filenames, specific to the grouping type.
dist.method="bray" 

# 7.3.2 # calculate relative abunance and occurrence frequency in the regional pool
grp.lev=unique(groupi[,1])
ab.grps=t(sapply(1:length(grp.lev),
                  function(i)
                  {
                    sampi=rownames(groupi)[groupi[,1]==grp.lev[i]]
                    colMeans(comm[which(rownames(comm) %in% sampi),,drop=FALSE])
                  }))
meta.com=t(as.matrix(colMeans(ab.grps)))
com01=comm
com01[com01>0]=1
freq.grps=t(sapply(1:length(grp.lev),
                 function(i)
                 {
                   sampi=rownames(groupi)[groupi[,1]==grp.lev[i]]
                   colMeans(com01[which(rownames(com01) %in% sampi),,drop=FALSE])
                 }))
meta.frequency=t(as.matrix(colMeans(freq.grps)))

# 7.3.3 # calculate tNST
t1=Sys.time()
setwd(save.wd)
tnst=NST::tNST(comm=comm, group=groupi, meta.group=NULL,
               meta.com=meta.com, meta.frequency = meta.frequency,
               dist.method=dist.method, abundance.weighted=TRUE, rand=rand.time,
               output.rand=TRUE, nworker=nworker, LB=FALSE, null.model="PF",
               between.group=FALSE, SES=TRUE, RC=TRUE)

save(tnst,file = paste0(prefixi,".tNST.rda")) # save tNST output in R data format
write.table(tnst$index.grp,row.names = FALSE,file = paste0(prefixi,".tNST.summary.csv"), quote = FALSE,sep = ",")
write.table(tnst$index.pair.grp,row.names = FALSE,file = paste0(prefixi,".tNST.pairwise.csv"),quote = FALSE,sep = ",")
format(Sys.time()-t1)

# END
