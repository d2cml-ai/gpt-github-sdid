setwd("~/Personal/Work/gpt_github_did/analysis/code")

data = read.csv("../../build/output/pushes_clean.csv")

library(synthdid)

data$pushes_pc100k = data$pushes_pc * 100000

setup = panel.matrices(
        data, unit = "iso2_code", time = "year_quarter_num", outcome = "pushes_pc100k",
        treatment = "gpt_available_post1"
)

sdid_post1 = synthdid_estimate(setup$Y, setup$N0, setup$T0)
print(summary(sdid_post1))

sc_post1 = sc_estimate(setup$Y, setup$N0, setup$T0)
print(summary(sc_post1))

did_post1 = did_estimate(setup$Y, setup$N0, setup$T0)
print(summary(did_post1))

plot(sdid_post1)
plot(sc_post1)
plot(did_post1)
