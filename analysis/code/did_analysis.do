replace language = upper(language)
gen data_science_lan = 1 if language == "PYTHON"
replace data_science_lan = 1 if strpos(language, "SQL")
replace data_science_lan = 1 if language == "R"
replace data_science_lan = 1 if strpos(language, "VBA")
replace data_science_lan = 1 if strpos(language, "JULIA")
replace data_science_lan = 1 if strpos(language, "JAVASCRIPT")
replace data_science_lan = 1 if strpos(language, "JAVA")
replace data_science_lan = 1 if strpos(language, "SCALA")
replace data_science_lan = 1 if strpos(language, "SASS")
replace data_science_lan = 1 if strpos(language, "MATLAB")
replace data_science_lan = 1 if language == "C"
replace data_science_lan = 1 if language == "C++"
replace data_science_lan = 1 if strpos(language, "SWIFT")