Known Issues: 

	Running config.bat as Administrator causes script to quit prematurely. Running by double clicking doesn't have this issue. Because this runs as an admin user already this is a low priority issue. I would still like to fix as this should run regardless long as you are an admin.
		Effects: User creation

	Using Get-BitsTransfer to retrieve Office 365 Uninstaller fails - Low priority issue as I can just use the one that I have saved local as this is small.

	Using Get-BitsTransfer to retrieve Ninite script doesn't work and complains about architecture. Downloading with the old method seems to work just fine. Where this is so small I don't plan to fix this, but if the opportunity presents itself I will.

	Using Get-BitsTransfer to retrieve Agent results in a dropped connection before the download can start. Downloading with the old method seems to work just fine. Where this is so small I don't plan to fix this, but if the opportunity presents itself I will.

	Battery Status just throws errors when running against a desktop for the first section of code trying to get details about the charge status. I will eventually silent this, but is only at this time a medium priority issue.

	When adding users you may run into a lot of errors, these can usually be ignored, but a lot of work still needs to go into this section in the case a password doesn't match or maybe you need to add another user that I don't provide. This is a medium-high priority issue as I'd like to get this section cleaned up.

	Removing users needs a lot of work and is a low priority issue to resolve and clean up
