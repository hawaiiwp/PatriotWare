if ($args[0] -eq "-h") {
    Get-Content readmes\delUsers.md
    Exit 1
}

Disable-LocalUser -Name "Guest"

.\functions\whiteSpace.ps1 "data_files\goodUsers.txt"
.\functions\whiteSpace.ps1 "data_files\badUsers.txt"
.\functions\whiteSpace.ps1 "data_files\users.txt"

$String = "Have you come after editing the data_files\badUsers.txt file? (y/n)"
$Selection = Read-Host $String
Switch($Selection) {
    'y' {
        "Oh, fun!"

        .\functions\getUsers.ps1 "data_files\users.txt"

        $users = Get-Content data_files\users.txt
        $goodUsers = Get-Content data_files\goodUsers.txt
        $badUsers = Get-Content data_files\badUsers.txt

        .\functions\yn.ps1 "Would you like to delete the following users?`n${badUsers}`n(y/n)" "Cool" "Cool, exiting. Make sure to edit the data_files\badUsers.txt file and come back!" "-d" "-e"

        foreach ($badUser in $badUsers) {
            Write-Output "The user ${badUser} was deleted. (Along with your mom lmao XDDDDDDDDDDDD)"
            Remove-LocalUser -name $badUser
        }
        
        Exit 1
    }
    'n' {
        "Bepic, moving on..."
    }
}

#The above function was stolen from stack overflow. What are you gonna do, cry?

Write-Output "" > data_files\badUsers.txt

.\functions\getUsers.ps1 "data_files\users.txt"

$users = Get-Content data_files\users.txt
$goodUsers = Get-Content data_files\goodUsers.txt
$badUsers = Compare-Object $goodUsers $users -PassThru | Where-Object {
    $_.SideIndicator -eq "=>"
}

foreach ($badUser in $badUsers) {
    if ($badUser -eq $badUsers[0]) {
        Write-Output $badUser > data_files\badUsers.txt
    }
    else {
        Write-Output $badUser >> data_files\badUsers.txt
    }
}

if ($badUsers.Length -eq 0) {
    Write-Output "No users needed to be deleted. I am but a program built by a stupid teenager though, so maybe double check."
    Exit 1
}

.\functions\yn.ps1 "Would you like to delete the following users?`n${badUsers}`n(y/n)" "Cool" "Cool, exiting. Make sure to edit the data_files\badUsers.txt file and come back!" "-d" "-e"

foreach ($badUser in $badUsers) {
    Remove-LocalUser -name $badUser
    Write-Output "The user ${badUser} was deleted. (Along with your mom lmao XDDDDDDDDDDDD)"
}