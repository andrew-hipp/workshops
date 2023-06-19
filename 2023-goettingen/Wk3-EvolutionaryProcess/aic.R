function (x = NA, ...) 
{
    if (!hasArg(L)) {
        L <- logLik(x)
    }
    else {
        L = list(...)$L
    }
    dev <- -2 * L
    if (!hasArg(K)) {
        K = attr(L, "df")
    }
    else {
        K = list(...)$K
    }
    aic <- dev + 2 * K
    if (!hasArg(n)) {
        n = attr(L, "nall")
    }
    else {
        n = list(...)$n
    }
    aic.c <- aic + (2 * K * (K + 1))/(n - K - 1)
    out <- list(aic = aic, aic.c = aic.c, n = n, K = K, lnL = L)
    if ("modelStruct" %in% names(x)) 
        out$param = as.numeric(x$modelStruct)
    class(out) <- "aic"
    return(out)
}
