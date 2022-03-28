# add local user with name Kasutaja2
$userPassword = ConvertTo-SecureString "Parool1!" -AsPlainText -Force
New-LocalUser "Kasutaja2" -Password $userPassword -FullName "Esimmene Kasutaja" -Description "Local Accont -kasutaja2"