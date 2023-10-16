clear

Write-Host "Hello! My name is HTMLScript 700. I am here to help you create an HTML portfolio."
$Name = Read-Host "First off, what is your name?"
$Age = Read-Host "Fantastic. Now, how old are you?"
Write-Host "Wow, $Age! That's not too bad!"
$Tea = Read-Host "What's your favorite type of tea?"

$NameString = "Hi my name is $Name"
$AgeString = "I am $Age years old"
$TeaString = "My favorite tea is $Tea"



New-HTML{
    New-HTMLSection -HeaderText $Name{
        New-HTMLPanel {
            New-HTMLList -Type Unordered{
                New-HTMLListItem -Text $NameString
                New-HTMLListItem -Text $AgeString
                New-HTMLListItem -Text $TeaString
            }
        }
    }
    
    New-HTMLWinBox -BackgroundColor Red {
        New-HTMLText -Text 'I like to creep around my home and act like a goblin. I dont know why but I just enjoy doing this. Maybe its my way of dealing with stress or something but I just do it about once every week. Generally Ill carry around a sack and creep around in a sort of crouch-walking position making goblin noises, then Ill walk around my house and pick up various different “trinkets” and put them in my bag while saying stuff like “Ill be having that” and laughing maniacally in my goblin voice (“trinkets” can include anything from shit I find on the ground to cutlery or other utensils). The other day I was talking with my neighbours and they mentioned hearing weird noises like what I wrote about and I was just internally screaming the entire conversation. Im 99% sure they dont know its me but god that 1% chance is seriously weighing on my mind.'
    } -Width 50% -Height 50% -X center -Y center
} -TitleText "Portfolio" -FavIcon "$PSScriptRoot\favicon.png" -FilePath $PSScriptRoot\Portfolio.html -ShowHTML -Online
