for ($i = 1; $i -lt $args[0]; $i++) {
    New-LocalUser -Name "temp${i}" -noPassword
}