# LCP v1.0.1
This is a datapackage containing the species list of the Leipzig Plant Catalogue. To use the data for name resolution use the [`lcplants`](https://github.com/idiv-biodiversity/lcplants) package.

# Installation
You can easily install `LCP` from within R using devtools (you may need to instsall devtools first).

```r
devtools::install_github("idiv-biodiversity/LCP")
```

# Usage
LCP is a data package. You can use it to access and export the Leipzig Plant Catalogue. For taxonomic name resolution using LCP use the [`lcplants`](https://github.com/idiv-biodiversity/lcplants) package

```{r}
data(tab_lcp)
str(tab_lcp)
head(tab_lcp)
```

# Citation
Freiberg M, Winter M, Gentile A, Zizka A, Muellner-Riehl AN, Weigelt A & Wirth C. The Leipzig Catalogue of Plants (LCP) –- An improved taxonomic reference list for all known vascular plants. R package, available at https://github.com/idiv-biodiversity/lcplants.
