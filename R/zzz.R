# package:: used for all packages but base because of the details section of ns-hooks {base} (e.g. ?.onLoad)
.onLoad <- function(libname, pkgname) {
	methods::setOldClass("lfactor")
  methods::setGeneric("match", where=.GlobalEnv)
	methods::setMethod("match", methods::signature(x="lfactor"), mlfactor, where=.GlobalEnv)
	methods::setMethod("match", methods::signature(table="lfactor"), mlfactor, where=.GlobalEnv)
	methods::setMethod("match", methods::signature(x="lfactor", table="lfactor"), mlfactor, where=.GlobalEnv) 
  methods::setGeneric("%in%", where=.GlobalEnv)
	methods::setMethod("%in%", methods::signature(x="lfactor"), inlf, where=.GlobalEnv)
	methods::setMethod("%in%", methods::signature(table="lfactor"), inlf, where=.GlobalEnv)
	methods::setMethod("%in%", methods::signature(x="lfactor", table="lfactor"), inlf, where=.GlobalEnv) 
}

.onAttach <- function(libname, pkgname) {
	packageStartupMessage(paste0("lfactors v", utils::packageDescription("lfactors")$Version, "\n"))
}
