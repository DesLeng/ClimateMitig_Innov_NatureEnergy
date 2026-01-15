*===========================================================
* MODULE H2-01: Hydrogen inventions – BRICS vs Rest of World
*===========================================================

use "$patstpath/mitigation/Hydrogen_ZOOM_inventor_ctry_year", clear

* Analysis window
keep if publn_year >=1995 & publn_year <=2025

* Identify BRICS-5
gen byte brics = inlist(invt_iso,"BRA","RUS","IND","CHN","ZAF")

* Aggregate yearly hydrogen inventions
bysort publn_year: egen H2_BRICS = sum(world_hvi_H2 * brics)
bysort publn_year: egen H2_WORLD = sum(world_hvi_H2)

gen H2_RoW = H2_WORLD - H2_BRICS

keep publn_year H2_BRICS H2_RoW H2_WORLD
duplicates drop
sort publn_year

save "$datapath/Analysis/Hydrogen/H2_BRICS_RoW_year.dta", replace
