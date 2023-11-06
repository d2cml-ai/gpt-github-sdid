clear all

global main C:/Users/Work/Documents/Personal/Work/gpt-github-sdid

cd $main

import delimited build/output/pushes_clean.csv

gen pushes_p100k = pushes_pc * 100

cd ${main}/analysis/output

drop if iso2_code == "HK"

sdid pushes_p100k iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(did) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(did_, .png)

sdid pushes_p100k iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(sc) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(sc_, .png)

sdid pushes_p100k iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(sdid) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(sdid_, .png)
	
	
	
// HK graph
by year_quarter_num, sort: egen qmean_nohk = mean(cond(iso2_code != "HK", pushes_p100k, .))
by year_quarter_num, sort: egen qsd_nohk = sd(cond(iso2_code != "HK", pushes_p100k, .))
gen mean95upper_nohk = qmean_nohk + 2 * qsd_nohk

keep pushes_p100k iso2_code year_quarter_num qmean_nohk mean95upper_nohk

reshape wide pushes_p100k, j(iso2_code) i(year_quarter_num) string

line pushes_p100kHK year_quarter_num || line qmean_nohk year_quarter_num /// 
|| line mean95upper_nohk year_quarter_num


