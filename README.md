# Hyper-V & Active Directory Lab Automation

Sammlung von PowerShell-Skripten zur Automatisierung von Hyper-V-Laborumgebungen und Active-Directory-Bereitstellungen (Umschulung Fachinformatiker für Systemintegration).

## Enthaltene Skripte

### 1. `Reset-BasisAD-VMs.ps1`
- Geordnetes Herunterfahren von Client (`W11`), Member-Servern (`Server2`, `Server3`) und Domain Controllern (`Server1`, `DC`)
- Automatisches Wiederherstellen des Hyper-V-Prüfpunkts **Basis-AD**

### 2. `Install-ADDS-ChildDomain.ps1`
- Installation der Serverrolle **Active Directory Domain Services (ADDS)** inklusive Verwaltungstools (`RSAT`)
- Automatisierte Heraufstufung zum Domain Controller und Erstellung einer untergeordneten Domäne (**Child-Domain** `sub.gfnlab.test`) mittels `PSCredential`

### 3. `Remove-ComputerFromDomain.ps1`
- Automatisiertes Entfernen eines Member-Servers (`Server3`) aus der Active-Directory-Domäne (`gfnlab`) und Beitritt zur Arbeitsgruppe `WORKGROUP` inklusive Neustart
- Anschließende Änderung des lokalen Administrator-Kennworts über `Set-LocalUser`

### 4. `Quick-Restore-BasisAD.ps1`
- Einzeiler (*One-Liner*) zum schnellen Zurücksetzen aller registrierten Hyper-V-VMs auf den Prüfpunkt **Basis-AD** ohne manuelle Bestätigung
