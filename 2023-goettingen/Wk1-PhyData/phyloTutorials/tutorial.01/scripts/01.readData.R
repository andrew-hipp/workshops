# script 01.readData.R

library(maps) # I generally put all the libraries I need at the top of the script
library(ape) # put this at the very top of the script, just so your libraries are in one place

## Data reading -- I add this comment with a double hash so I can quickly find sections of my code
path <- 'https://raw.githubusercontent.com/andrew-hipp/workshops/master/data/oaks2018/'
dat.bio <- read.csv(paste(path, 'oak.dat.eco.trimmed.csv', sep = ''), as.is = T)
dat.bio.bySp <- split(dat.bio, dat.bio$species) # produces a list, one data frame each
tr <- read.nexus(paste(path, 'trs.calib.jackknife.4.annotated.tre', sep = '')) 

# sections for each species:
dat.sections <- read.csv(paste(path, 'sect.species.translate.csv', sep = ''), as.is = T, row.names = 1)

# geography for each species:
dat.geog <- read.csv(paste(path, 'spp.geog.csv', sep = ''), as.is = T, row.names = 1)

# and leaf traits:
dat.lf <- read.delim(paste(path, 'lfPhenology.2016-03-09.jcb.tsv', sep = ''), row.names = 1, as.is = T)


## Data formatting and exporting
dir.create('maps')

for(i in names(dat.bio.bySp)[1:10]) { # this creates an index, i, of the unique species names; 
                                      # we'll just do the first 10
    message(paste('doing map', i)) # gives us a status message so we know something is going on...
    jpeg(paste('maps/', i, '.jpg', sep = ''), 800, 600) # opens a jpg file named by species, 800 x 600 pt
    map() # plots the base map; you can limit the range by lat and long using ylim and xlim
    title(i) # adds a title at the top of our map
    points(dat.bio.bySp[[i]]$longitude, 
           dat.bio.bySp[[i]]$latitude,
           pch = 21, col = 'black', bg = 'red', 
           cex = 2) # plot points, red with black outline, 2x normal size
    dev.off() # close pdf file
    } # close for loop

numCols <- grep('lat|long|bio', names(dat.bio), value = T)
dat.bio.means <- t(sapply(dat.bio.bySp, function(x) apply(x[, numCols], 2, mean, na.rm = T)))
head(dat.bio.means)
                          
dat.bio.sem <- t(sapply(dat.bio.bySp, function(x) {
    apply(x[, numCols], 2, sd, na.rm = T) / sqrt(dim(x)[1])
    } # close function
                        ) # close sapply
                 ) # close t

temp.na = names(which(table(dat.bio$species) == 1))

temp.sd <- apply(t(sapply(dat.bio.bySp, function(x) apply(x[, numCols], 2, sd, na.rm = T))),
    2,
    mean, 
    na.rm = T) # the mean of the standard deviation for all these variables
                   
dat.bio.sem[temp.na, ] <- matrix(temp.sd, length(temp.na), length(temp.sd), byrow = T)
                  
if(identical(row.names(dat.bio.means), row.names(dat.bio.sem)))
    row.names(dat.bio.means) <- row.names(dat.bio.sem) <- paste('Quercus', row.names(dat.bio.means), sep = '_')

spp.intersect <- Reduce(intersect, list(tr$tip.label,
                                      row.names(dat.bio.means),
                                      row.names(dat.geog),
                                      row.names(dat.lf),
                                      row.names(dat.sections)))

tr <- drop.tip(tr, which(!tr$tip.label %in% spp.intersect))
                   
dat.bio.means <- dat.bio.means[spp.intersect, ]
dat.bio.sem <- dat.bio.sem[spp.intersect, ]
dat.geog <- dat.geog[spp.intersect, ]
dat.lf <- dat.lf[spp.intersect, ]
dat.sections <- dat.sections[spp.intersect, ]
                   