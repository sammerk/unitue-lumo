#show: doc => brief(
$if(lang)$
  lang: "$lang$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
  logo: image("ut-logo.png", height: 14mm),
$if(faculty)$
  faculty: [$faculty$],
$endif$
$if(institute)$
  institute: [$institute$],
$endif$
$if(sender-name)$
  sender-name: [$sender-name$],
$endif$
$if(contact-name)$
  contact-name: [$contact-name$],
$endif$
$if(contact-function)$
  contact-function: [$contact-function$],
$endif$
$if(phone)$
  phone: [$phone$],
$endif$
$if(fax)$
  fax: [$fax$],
$endif$
$if(email)$
  email: [$email$],
$endif$
$if(web)$
  web: [$web$],
$endif$
$if(reference)$
  reference: [$reference$],
$endif$
$if(street)$
  street: [$street$],
$endif$
$if(city)$
  city: [$city$],
$endif$
$if(letter-date)$
  letter-date: "$letter-date$",
$endif$
$if(recipient)$
  recipient: (
$for(recipient)$
    [$recipient$],
$endfor$
  ),
$endif$
$if(title)$
  subject: [$title$],
$endif$
$if(salutation)$
  salutation: [$salutation$],
$endif$
$if(closing)$
  closing: [$closing$],
$endif$
$if(enclosures)$
  enclosures: [$enclosures$],
$endif$
$if(signature)$
  signature: image("$signature$", height: 12.5mm),
$endif$
  doc,
)
