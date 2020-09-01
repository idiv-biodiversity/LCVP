# LCVP v1.0.3
This is a datapackage containing the species list of the Leipzig Plant Catalogue. To use the data for name resolution use the [`lcvplants`](https://github.com/idiv-biodiversity/lcplants) package.

# Installation
You can easily install `LCVP` from within R using devtools (you may need to instsall devtools first).

```r
devtools::install_github("idiv-biodiversity/LCVP")
```

# Usage
LCP is a data package. You can use it to access and export the Leipzig Vascular Plant Catalogue. For taxonomic name resolution using LCVP use the [`lcvplants`](https://github.com/idiv-biodiversity/lcvplants) package.

```{r}
data(tab_lcvp)
str(tab_lcvp)
head(tab_lcvp)

data(ref_lcvp)
head(ref_lcvp)
```

# Citation

```{r}
library(LCVP)
citation("LCVP")
```
