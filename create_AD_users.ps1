# location of AD users file
$file = "C:\Users\Administrator\Documents\adusers.csv"
# import file content 
$users = Import-Csv $file -Encoding Default -Delimiter ";"
# foreach user data row in file
foreach ($user in $users){
    # username is firstname.lastname
    $username = $user.Firstname + "." + $user.LastName
    $username = $username.ToLower()
    # function translit UTF-8 character to LATIN
    $username = Translit($username)
        $upname = $username + "@sv-kool.local"
    $displayname = $user.FirstName + " " + $user.LastName
    $displayname = $user.FirstName + " " + $user.LastName
    New-ADUser -Name $username `
        -DisplayName $displayname `
        -GivenName $user.FirstName `
        -Title $user.Role `
        -Surname $user.LastName `
        -Department $user.Department `
        -UserPrincipalName $upname `
        -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -force) -Enabled $true
}

Function Translit {
    param(
          [string] $inputstring
          )
    $Translit = @{
    [char]'õ' = "o"
    }
    $outputstring=""
    foreach ($character in $inputcharacter = $inputstring.ToCharArray())
    {
   if ($Translit[$character] -cne $Null ){
   $outputstring =$outputstring + $Translit[$character]
   } else {
      $outputstring = $outputstring + $character
   }
    }
   Write-Output $outputstring
 }