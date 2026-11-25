#-------------------------------------------------------------------
# Schnell-Reset: Alle Hyper-V-VMs direkt auf "Basis-AD" zurücksetzen
#-------------------------------------------------------------------

# Setzt alle vorhandenen virtuellen Maschinen ohne Rückfrage auf den Prüfpunkt "Basis-AD" zurück
Get-VM | Restore-VMCheckpoint -Name "Basis-AD" -Confirm:$false

Write-Host "Alle VMs wurden erfolgreich auf den Prüfpunkt 'Basis-AD' zurückgesetzt."
