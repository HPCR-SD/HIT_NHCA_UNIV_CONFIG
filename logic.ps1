#Pauses could be replaced with Start-Sleep -s <seconds> and given enough time could make for a better automated script

# Call functions.ps1 to pair the heart of our code with the brains
. .\functions.ps1
. .\subfunctions.ps1

$CT_ARange = 1..4
while ($CT_ARange -notcontains $ConfigType) {
	$ConfigType = Read-Host "Submit the number associated with the configuration process you'd like to use:`n1. Pre-Config, 2. Post Config, 3. Full Config, 4. Repair Menu"
}

If (1 -contains $ConfigType) {
	$CS_ARange = 1..2
	While ($CS_ARange -notcontains $ConfigStage) {
		$ConfigStage = Read-Host "Submit the number associated with the Full Config Stage you are at:`n1. Pre-Domain and 2. Post Domain"
	}
}

$CL_ARange = 1..2
while ($CL_ARange -notcontains $ConfigLocation) {
	$ConfigLocation = Read-Host "Submit the number associated with the Location of the machine:`n1. Onsite and 2. Remote"
}

Switch ($ConfigType) {
	1 {
		Switch ($ConfigLocation) {
			1 {
				Switch ($ConfigStage) {
					1 { # Pre-Config / Onsite / Pre-Domain
						Write-Host "Starting Pre-Config Part 1 of 2..."
						Check-PluggedIn
						Change-SystemTimeoutStart
						Add-SoftwareDownloadQueue
						Add-DesktopShortcuts
						Check-SoftwareDownloadQueue
						Remove-Office
						Add-OpenVPN
						Add-Adobe
						Add-NiniteScript
						Add-Agent
						New-SysopAdmin
						New-FirstLoginUser
						hostname | clip
						hostname
						Pause
						#Stop-Process -Name 'OpenVPNConnect' -Force
						Add-Domain
					}

					2 { # Pre-Config / Onsite / Post Domain
						#Part 2 of 2
						Add-Office
						Write-Host "Make sure Office is done installing before continuing"
						pause
						Change-SystemTimeoutEnd
						Update-System
						Write-Host "Make sure everything is completed. Continuing will restart the computer."
						pause
						shutdown /r
					}
				}
            }

			2 {
				Switch ($ConfigStage) {
					1 { # Pre-Config / Remote / Pre-Domain
						Write-Host "Starting Pre-Config Part 1 of 2..."
						Check-PluggedIn
						Change-SystemTimeoutStart
						Add-SoftwareDownloadQueue
						Add-DesktopShortcuts
						Check-SoftwareDownloadQueue
						Remove-Office
						Add-OpenVPN
						Add-Adobe
						Add-NiniteScript
						Add-Agent
						New-SysopAdmin
						New-FirstLoginUser
						hostname | clip
						hostname
						Write-Host "Please make sure OpenVPN has been installed before continuing"
						Pause
						#Stop-Process -Name 'OpenVPNConnect' -Force
						Write-Host "Connect to VPN before continuing"
						Add-Domain
					}

					2 { # Pre-Config / Remote / Post Domain
						#Part 2 of 2
						Write-Host "Starting Pre-Config Part 2 of 2..."
						#& "C:\Program Files\OpenVPN Connect\OpenVPNConnect.exe"
						#Write-Host "Connect to VPN before continuing"
						#pause
						#Write-Host "Switch Users to login as mtsadmin"
						#pause
						Add-Office
						Write-Host "Make sure Office is done installing before continuing"
						pause
						Change-SystemTimeoutEnd
						Update-System
						Write-Host "Make sure everything is completed. Continuing will restart the computer."
						pause
						shutdown /r
					}
				}
			}	
		}
	}

	2 {		
		Switch ($ConfigLocation) {
			1 { # Post Config / Onsite
				Write-Host "Starting Post Config..."
				Pause
				Remove-AnyUser
				#Bitlocker and such thing that only happen after user has computer and we initially get in
			}

			2 { # Post Config / Remote
				Write-Host "Starting Post Config..."
				Pause
				Remove-AnyUser
				#Bitlocker and such thing that only happen after user has computer and we initially get in
			}	
		}
	}

	3 {
		Switch ($ConfigLocation) {
			1 { # Full Config / Onsite
			
			}

			2 { # Full Config / Remote

			}	
		}
    }

	4 {
		Switch ($ConfigLocation) {
			1 { # Repair / Onsite
			
			}

			2 { # Repair / Remote

			}	
		}
	}
}