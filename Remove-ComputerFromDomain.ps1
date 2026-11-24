#-------------------------------------------------------------------
# Schritt 1: Server aus der Domäne entfernen (Server3 -> WORKGROUP)
#-------------------------------------------------------------------

# Klartext-Passwort verschlüsselt speichern
$AdminPwd = ConvertTo-SecureString "Kennw0rt!" -AsPlainText -Force

# Domänen-Anmeldekonto definieren
$DomAdmin = "gfnlab\administrator"

# Definition des Objekttyps "PSCredential"
$ObjectTypPSCredential = "System.Management.Automation.PSCredential"

# Anmeldeinformationen erstellen (PSCredential-Objekt)
$DomAdminCred = New-Object $ObjectTypPSCredential ($DomAdmin, $AdminPwd)

# Computer aus der Domäne entfernen und in Arbeitsgruppe "WORKGROUP" aufnehmen
Remove-Computer -ComputerName "Server3" `
                -UnjoinDomainCredential $DomAdminCred `
                -WorkgroupName "WORKGROUP" `
                -Restart `
                -Force

#-------------------------------------------------------------------
# Schritt 2: Nach dem Neustart als lokaler Administrator ausführen
#-------------------------------------------------------------------

# Passwort des lokalen Administrators ändern
# $newLocalAdminPwd = ConvertTo-SecureString "Pa55w.rd" -AsPlainText -Force
# $UserAccount = Get-LocalUser -Name "Administrator"
# $UserAccount | Set-LocalUser -Password $newLocalAdminPwd
