import pandas as pd
import pycountry

raw_data = pd.read_csv("build/input/languages.csv")
raw_data = raw_data[(raw_data.iso2_code != "EU") & (raw_data.iso2_code.notna())]
raw_data["time_period"] = (raw_data.year - 2020) * 4 + raw_data.quarter
raw_data = raw_data[raw_data["time_period"] <= 13]
allLanguagesPerCountry = raw_data.groupby("iso2_code")["language"].unique()
languagesAndCountries = dict(zip(allLanguagesPerCountry.index, allLanguagesPerCountry.values))
languageToLanguageType = {language: raw_data[raw_data.language == language]["language_type"].values[0] for language in raw_data.language.unique()}
countryCodes = raw_data.iso2_code.unique()
gpt_countries_list = [
        "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria",
        "Azerbaijan", "Bahamas", "Bangladesh", "Barbados", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia",
        "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Cabo Verde", "Canada",
        "Chile", "Colombia", "Comoros", "Congo (Congo-Brazzaville)", "Costa Rica", "Côte d'Ivoire", "Croatia", "Cyprus",
        "Czechia", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "El Salvador", "Estonia", "Fiji",
        "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea",
        "Guinea-Bissau", "Guyana", "Haiti", "Holy See", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iraq",
        "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait",
        "Kyrgyzstan", "Latvia", "Lebanon", "Lesotho", "Liberia", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar",
        "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico",
        "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar", "Namibia",
        "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Macedonia", "Norway",
        "Oman", "Pakistan", "Palau", "Palestine, State of", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines",
        "Poland", "Portugal", "Qatar", "Romania", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia",
        "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal",
        "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "South Africa",
        "South Korea", "Spain", "Sri Lanka", "Suriname", "Sweden", "Switzerland", "Taiwan", "Tanzania", "Thailand",
        "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Tuvalu", "Uganda", "Ukraine",
        "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Vanuatu", "Zambia"
]
iso_special_cases = {
        "Czechia (Czech Republic)": "CZ",
        "Congo (Congo-Brazzaville)": "CG",
        "Holy See": "VA",
        "Timor-Leste (East Timor)": "TL",
        "Ukraine (with certain exceptions)": "UA",
        "Taiwan": "TW", 
        "Bolivia": "BO",
        "Tanzania": "TZ",
        "Korea": "KR",
        "Moldova": "MD", 
        "Brunei": "BN"
}

def append_country_period_missing_languages(raw_data, country, countryData, period):
        countryPeriodData = countryData[countryData.time_period == period]
        countryPeriodLanguages = countryPeriodData.language.unique()
        periodMissingLanguages = list(set(languagesAndCountries[country]) - set(countryPeriodLanguages))
        numberOfMissingLanguages = len(periodMissingLanguages)
        quarter = 4 if period % 4 == 0 else period % 4
        year = (period - quarter) / 4 + 2020
        if numberOfMissingLanguages > 0:
                # print(country, periodMissingLanguages)
                missingCountryYearLanguages = pd.DataFrame({
                        "num_pushers": [0.0] * numberOfMissingLanguages,
                        "language": periodMissingLanguages,
                        "language_type": [languageToLanguageType[language] for language in periodMissingLanguages],
                        "quarter": [quarter] * numberOfMissingLanguages,
                        "year": [year] * numberOfMissingLanguages,
                        "time_period": [period] * numberOfMissingLanguages, 
                        "iso2_code": [country] * numberOfMissingLanguages
                })
                raw_data = pd.concat([raw_data, missingCountryYearLanguages], ignore_index=True)
        return raw_data

def append_country_missing_periods(raw_data, country, countryPeriods):
        missingPeriods = list(set(raw_data.time_period.unique()) - set(countryPeriods))
        numberOfMissingPeriods = len(missingPeriods)
        quarters = [4 if period % 4 == 0 else period % 4 for period in missingPeriods]
        years = [(period - quarter) / 4 + 2020 for (period, quarter) in zip(missingPeriods, quarters)]
        if numberOfMissingPeriods > 0:
                missingCountryPeriods = pd.DataFrame({
                        "num_pushers": [0.0] * len(languagesAndCountries[country]) * numberOfMissingPeriods,
                        "language": list(languagesAndCountries[country]) * numberOfMissingPeriods,
                        "language_type": [languageToLanguageType[language] for language in languagesAndCountries[country]] * numberOfMissingPeriods,
                        "quarter": quarters * len(languagesAndCountries[country]),
                        "year": years * len(languagesAndCountries[country]),
                        "time_period": missingPeriods * len(languagesAndCountries[country]),
                        "iso2_code": [country] * numberOfMissingPeriods * len(languagesAndCountries[country])
                })
                raw_data = pd.concat([raw_data, missingCountryPeriods], ignore_index=True)
        
        return raw_data

def append_country_missing_periods_languages(raw_data, country):
        countryData = raw_data[raw_data.iso2_code == country]
        countryLanguages = countryData["language"].unique()
        countryPeriods = countryData.time_period.unique()
        raw_data = append_country_missing_periods(raw_data, country, countryPeriods)
        for period in countryPeriods:
              raw_data = append_country_period_missing_languages(raw_data, country, countryData, period)
              
        
        return raw_data

def balance_data(raw_data):
        
        for country in countryCodes:
             raw_data = append_country_missing_periods_languages(raw_data, country)
        
        return raw_data
                
def country_to_iso2(country_name):
        try:
                return pycountry.countries.get(name=country_name).alpha_2
        except AttributeError:
                try:
                # Handle special cases where the country name doesn't match pycountry's database exactly
                        return iso_special_cases[country_name]
                except KeyError:
                        return None

balanced_data = balance_data(raw_data)

gpt_countries_iso = [country_to_iso2(country) for country in gpt_countries_list]

balanced_data["gpt_available"] = balanced_data["iso2_code"].apply(lambda row: 1 if row in gpt_countries_iso else 0)
balanced_data["post1"] = (balanced_data["time_period"] >= 12).astype(int)
balanced_data["post2"] = (balanced_data["time_period"] >= 13).astype(int)
balanced_data["gpt_available_post1"] = balanced_data["gpt_available"] * balanced_data["post1"]
balanced_data["gpt_available_post2"] = balanced_data["gpt_available"] * balanced_data["post2"]

balanced_data.to_csv("build/output/languages_clean.csv", index = False)


