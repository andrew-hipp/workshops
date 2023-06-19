function (x, ...) 
{
    L <- logLik(x)
    dev <- -2 * L
    K = attr(L, "df")
    n = attr(L, "nall")
    aic <- dev + 2 * K
    aic.c <- aic + (2 * K * (K + 1))/(n - K - 1)
    out <- list(aic = aic, aic.c = aic.c, n = n, K = K, lnL = L)
    if ("modelStruct" %in% names(x)) 
        out$param = as.numeric(x$modelStruct)
    class(out) <- "aic"
    return(out)
}
