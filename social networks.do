clear 
set more off 
cd "/Users/Edward/Desktop/ICPSR_22140/DS0002"
use "22140-0002-Data.dta", clear 

* 1. Forming the edgelist 
generate interview_date=date(intdate,"DMY") 
* drop if interview_date <= "14248" 
* this is for jan 04 1999 
* jan 04 2001 number is 14613
* jan 02 2022 number is 15342
drop if interview_date <= 15342
format interview_date %d
drop if id1==0
*combine id1 and id2 
egen ID = concat(id1 id2)
destring ID, replace 
*drop duplicates after you combine them 
duplicates drop ID, force
drop ID 
keep id1 id2 
save hiv_edgelist.dta, replace 







clear 
set more off 
use "22140-0002-Data.dta", clear 
* 1. Forming the edgelist 
generate interview_date=date(intdate,"DMY") 
* drop if interview_date <= "14248" 
* this is for jan 04 1999 
* jan 04 2001 number is 14613
* jan 02 2022 number is 15342
drop if interview_date <= 15342
format interview_date %d
drop if id1==0
*combine id1 and id2 
egen ID = concat(id1 id2)
destring ID, replace 
*drop duplicates after you combine them 
duplicates drop ID, force
drop ID 
keep rid frsttype idknown local race ethn sex orient behav occpres occcens age pro pimp john dealer drugman thief retired hwife disable unemp streets year marit educ gono gonoev chlam chlamev syph syphev hiv hbv gonohx chlamhx syphhx hivhx freq occ occloc frstyr yob studynum sources
drop study studynum occ occloc frstyr sources orient occpres occcens pro pimp john dealer drugman thief retired hwife disable frsttype gono gonoev chlam chlamev syph syphev hiv hbv gonohx chlamhx syphhx hivhx freq streets
replace ethn=1 if ethn==-9
save hiv_nodes.dta, replace 
 
 
 
 