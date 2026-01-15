use "$datapath/Analysis/Hydrogen/H2_BRICS_RoW_year.dta", clear

* Base year
gen base_BRICS = H2_BRICS if publn_year==1995
egen BRICS_1995 = max(base_BRICS)

gen base_RoW = H2_RoW if publn_year==1995
egen RoW_1995 = max(base_RoW)

gen idx_BRICS = H2_BRICS / BRICS_1995
gen idx_RoW   = H2_RoW   / RoW_1995

keep publn_year idx_BRICS idx_RoW
sort publn_year

export excel "$droppath/Analysis/Hydrogen/Figure_H22_growth.xlsx", ///
replace firstrow(variables)
