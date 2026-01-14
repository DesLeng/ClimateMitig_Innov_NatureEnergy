/********************************************************************
* NACI Report 2026 – CCMT Patent Indicators
* Master pipeline
********************************************************************/

do "01_select_ccmt_patents.do"
do "02_construct_ipc_benchmarks.do"
do "03_build_inventions.do"
do "04_build_transfers.do"
do "05_construct_panels.do"
