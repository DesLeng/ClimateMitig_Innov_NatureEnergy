* Master pipeline for modular CCMT patent workflow
do "$scripts/modular/01_select_ccmt_patents.do"
do "$scripts/modular/02_construct_ipc_benchmarks.do"
do "$scripts/modular/03_build_inventions.do"
do "$scripts/modular/04_build_transfers.do"
do "$scripts/modular/05_construct_panels.do"

