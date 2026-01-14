/********************************************************************
* Technology transfers
* Definition: DOCDB family with ≥2 inventor countries
********************************************************************/

use "$datapath/CCMT_inventions.dta", clear
merge 1:m docdb using "$patstpath/general/inventor_countries.dta", keep(match)
drop _merge

drop if inlist(appln_auth,"EP","WO")

bysort docdb technology: egen n_countries = nvals(invt_iso)
gen byte transfer = (n_countries >= 2)

collapse (sum) inv_weight (max) transfer HVI, ///
         by(technology invt_iso publn_year)

save "$datapath/CCMT_transfers.dta", replace
