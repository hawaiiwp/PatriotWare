if (args[0] -eq "-noRestrict") {
    Set-ExecutionPolicy unrestricted
}

#only use the -noRestrict option if you are lazy and dumb (like me). You should probably use "powershell.exe -noprofile -executionpolicy bypass -file .\script.ps1" instead.

New-Item data_files\badUsers.txt
New-Item data_files\goodUsers.txt
New-Item data_files\users.txt