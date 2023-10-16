The following are instructions to run a PowerShell script that I created, which uses a PowerShell plugin called PSWriteHTML.

This script will create a basic html portfolio for you. This script will utilize creating lists, applying a favicon, and creating pop-up windows.

Open PowerShell as an administrator. Navigate to the folder which you have saved the script in.

Let's install the PSWriteHTML plugin.

```powershell
Install-Module -name PSWriteHTML
```

When promtped, respond with "Y" or "A" to install modules from 'PSGallery'.

Next, create an html file called 'Portfolio.html'
```powershell
new-item Portfolio.html
```

Next, save an image (png) you would like to be used as an icon for you portfolio into the same folder as the script. Please name it "favicon.png".

After this, run the script
```powershell
.\lab7.ps1
```

