#-------------------------------------------------------------------
# Installation von ADDS und Erstellung einer Child-Domain (sub.gfnlab.test)
#-------------------------------------------------------------------

# Klartext-Passwort verschlüsselt speichern
$AdminPwd = ConvertTo-SecureString "Kennw0rt!" -AsPlainText -Force

# Lokales Anmeldekonto definieren
$LocalAdmin = ".\administrator"

# Definition des Objekttyps "PSCredential"
$ObjectTypPSCredential = "System.Management.Automation.PSCredential"

# Anmeldeinformationen erstellen (PSCredential-Objekt)
$LocalAdminCred = New-Object $ObjectTypPSCredential ($LocalAdmin, $AdminPwd)

# Installation der Rolle ADDS inkl. Verwaltungstools
Install-WindowsFeature -Name "AD-Domain-Services" `
                       -IncludeManagementTools `
                       -Credential $LocalAdminCred

# Festlegen des DSRM-Kennworts
$dsrmPw = ConvertTo-SecureString 'Kennw0rt!' -AsPlainText -Force

# Domänen-Anmeldekonto definieren (Stamm-Domänenadmin / Enterprise Admin)
$DomAdmin = "gfnlab\administrator"

# Abspeichern der Credentials vom Stamm-Domänenadmin
$DomAdminCred = New-Object $ObjectTypPSCredential ($DomAdmin, $AdminPwd)

# Child-Domain erstellen (sub.gfnlab.test)
Install-ADDSDomain -SkipPreChecks `
                   -DomainType ChildDomain `
                   -ParentDomainName "gfnlab.test" `
                   -NewDomainName "sub" `
                   -Credential $DomAdminCred `
                   -SafeModeAdministratorPassword $dsrmPw
