-- Englische Standardtexte bei lang: en. Nutzerangaben bleiben unangetastet;
-- ersetzt werden nur fehlende Werte und die deutschen Standardwerte.
local str = pandoc.utils.stringify

local de_faculty = "Wirtschafts- und Sozialwissenschaftliche Fakultät"
local de_institute = "Institut für Erziehungswissenschaft"

function Meta(meta)
  local lang = meta.lang and str(meta.lang) or "de"
  local en = lang:sub(1, 2) == "en"

  local function default(key, de_value, en_value)
    local cur = meta[key] and str(meta[key]) or nil
    if en then
      if cur == nil or cur == "" or cur == de_value then meta[key] = en_value end
    elseif cur == nil or cur == "" then
      meta[key] = de_value
    end
  end

  default("faculty", de_faculty, "Faculty of Economics and Social Sciences")
  default("institute", de_institute, "Department of Education")
  default("ut-university", "Eberhard Karls Universität Tübingen", "University of Tübingen")
  if en then
    default("author-label", "Autor", "Author")
    default("date-label", "Datum", "Date")
    default("license-label", "Lizenz", "License")
    meta["ut-en"] = true
  end
  return meta
end
