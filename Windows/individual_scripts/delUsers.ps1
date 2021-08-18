if ($args[0] -eq "-h") {
    Get-Content readmes\delUsers.md
    Exit 1
}

function cut {
    param(
      [Parameter(ValueFromPipeline=$True)] [string]$inputobject,
      [string]$delimiter='\s+',
      [string[]]$field
    )
  
    process {
      if ($null -eq $field) { $inputobject -split $delimiter } else {
        ($inputobject -split $delimiter)[$field] }
    }
}

$String = "Have you come after editing the data_files\badUsers.txt file? (y/n)"
$Selection = Read-Host $String
Switch($Selection) {
    'y' {
        "Oh, fun!"

        wmic useraccount get Name,Disabled | Select-String "FALSE.*" | cut -f 1 -d "     " > data_files\users.txt

        $users = Get-Content data_files\users.txt
        $goodUsers = Get-Content data_files\goodUsers.txt
        $badUsers = Get-Content data_files\badUsers.txt

        .\functions\yn.ps1 "Would you like to delete the following users?`n${badUsers}`n(y/n)" "Cool" "Cool, exiting. Make sure to edit the data_files\badUsers.txt file and come back!" "-d" "-e"

        foreach ($badUser in $badUsers) {
            Write-Output "The user ${badUser} was deleted. (Along with your mom lmao XDDDDDDDDDDDD)"
        }
        
        Exit 1
    }
    'n' {
        "Bepic, moving on..."
    }
}

#The above function was stolen from stack overflow. What are you gonna do, cry?

wmic useraccount get Name,Disabled | Select-String "FALSE.*" | cut -f 1 -d "     " > data_files\users.txt

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
    Write-Output "The user ${badUser} was deleted. (Along with your mom lmao XDDDDDDDDDDDD)"
}