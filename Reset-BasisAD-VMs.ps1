#-----------------------------------
# Alle VMs auf Basis-AD zurücksetzen
#-----------------------------------

# 1. Herunterfahren der Member-Server und des Clients
$ClientAndMember = @("W11", "Server2", "Server3")
foreach ($VM in $ClientAndMember) {
    Get-VM -Name $VM | Stop-VM -Force
}

# 2. Geordnetes Herunterfahren der Domain Controller
Write-Host "Bitte habe etwas Geduld."
Start-Sleep -Seconds 10
Get-VM -Name "Server1" | Stop-VM -Force
Start-Sleep -Seconds 10
Get-VM -Name "DC" | Stop-VM -Force
Write-Host "Alle VMs wurden erfolgreich beendet."

# 3. Prüfpunkt "Basis-AD" auf alle VMs anwenden
$AllVMs = @("DC", "Server1", "Server2", "Server3", "W11")
foreach ($VM in $AllVMs) {
    Get-VM -Name $VM | Restore-VMCheckpoint -Name "Basis-AD" -Confirm:$false
}
Write-Host "Prüfpunkt 'Basis-AD' wurde auf allen VMs angewendet."
