clear all

global main C:/Users/Work/Documents/Personal/Work/gpt-github-sdid

cd $main

import delimited build/output/main.csv

gen pushes_p100k = pushes_pc * 100000
gen developers_p100k = developers_pc * 100000

cd ${main}/analysis/output

drop if iso2_code == "HK"

sdid pushes_p100k iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(did) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(pp100_did_, .png)

sdid pushes_p100k iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(sc) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(pp100_sc_, .png)

sdid pushes_p100k iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(sdid) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(pp100_sdid_, .png)
	
	
	
// HK graph
preserve
by year_quarter_num, sort: egen qmean_nohk = mean(cond(iso2_code != "HK", pushes_p100k, .))
by year_quarter_num, sort: egen qsd_nohk = sd(cond(iso2_code != "HK", pushes_p100k, .))
gen mean95upper_nohk = qmean_nohk + 2 * qsd_nohk

keep pushes_p100k iso2_code year_quarter_num qmean_nohk mean95upper_nohk

reshape wide pushes_p100k, j(iso2_code) i(year_quarter_num) string

line pushes_p100kHK year_quarter_num || line qmean_nohk year_quarter_num /// 
|| line mean95upper_nohk year_quarter_num
restore

preserve
by year_quarter_num, sort: egen qmean_nohk = mean(cond(iso2_code != "HK", developers_pc, .))
by year_quarter_num, sort: egen qsd_nohk = sd(cond(iso2_code != "HK", developers_pc, .))
gen mean95upper_nohk = qmean_nohk + 2 * qsd_nohk

keep developers_pc iso2_code year_quarter_num qmean_nohk mean95upper_nohk

reshape wide developers_pc, j(iso2_code) i(year_quarter_num) string

line developers_pcHK year_quarter_num || line qmean_nohk year_quarter_num /// 
|| line mean95upper_nohk year_quarter_num
restore

preserve
by year_quarter_num, sort: egen qmean_nohk = mean(cond(iso2_code != "HK", pushes_perdev, .))
by year_quarter_num, sort: egen qsd_nohk = sd(cond(iso2_code != "HK", pushes_perdev, .))
gen mean95upper_nohk = qmean_nohk + 2 * qsd_nohk

keep pushes_perdev iso2_code year_quarter_num qmean_nohk mean95upper_nohk

reshape wide pushes_perdev, j(iso2_code) i(year_quarter_num) string

line pushes_perdevHK year_quarter_num || line qmean_nohk year_quarter_num /// 
|| line mean95upper_nohk year_quarter_num
restore

sdid developers_p100k iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(did) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(dp100_did_, .png)

sdid developers_p100k iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(sc) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(dp100_sc_, .png)

sdid developers_p100k iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(sdid) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(dp100_sdid_, .png)



sdid pushes_perdev iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(did) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(ppd_did_, .png)

sdid pushes_perdev iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(sc) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(ppd_sc_, .png)

sdid pushes_perdev iso2_code year_quarter_num gpt_available_post1, ///
	vce(bootstrap) reps(100) seed(1234) method(sdid) graph g1on /// 
	g1_opt(xtitle("") scheme(sj)) ///
	g2_opt(ytitle("Pushes per 100k inhabitants") scheme(sj) ///
	xtitle("Quarters since 2020Q1")) graph_export(ppd_sdid_, .png)



