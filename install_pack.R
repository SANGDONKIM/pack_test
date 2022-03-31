#renv::init()
pactxt <- readLines("/Users/sangdon/Desktop/adp/R_package_list.txt")

clean_pack <- pactxt %>% 
    as_tibble() %>% 
    tidyr::separate(value, c("package", "version"), sep = "\t") %>% 
    .[-1, ]

#clean_pack %>% view()

pack <- clean_pack %>% 
    filter(package%in%c("recipes", "data.table", "caret", "GGally", "tidyverse", "janitor", 
                        "rsample", "lubridate", "gridExtra", "randomForest", "xgboost", "kernlab", 
                        "glmnet", "MLmetrics", "DALEX", "pROC", "ggmosaic", "e1071", "factoextra", 
                        "NbClust", "FactoMineR", "mclust", "fpc", "dbscan", "kohonen", "clValid", 
                        "tidytext", "stopwords", "glue", "qicharts", "lpSolve", "forecast",
                        "EnvStats", "snpar", "dtw"))

pack

for (i in 1:nrow(pack)) {
    pack_list <- paste0(pack[i, 1]$package, '@', pack[i, 2]$version)
    try(renv::install(pack_list), silent = T)
}

geterrmessage()

packageVersion("stopwords")


renv::install("stopwords@2.1")


#renv::clean()
