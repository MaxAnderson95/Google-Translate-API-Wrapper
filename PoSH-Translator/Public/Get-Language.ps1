Function Get-Language {

    [CmdletBinding()]
    Param (

        [String]$LanguageCode,

        [String]$LanguageName,

        [String]$LocalizedResultsLanguageCode = 'en'

    )

    $Body = @{

        'target' = $LocalizedResultsLanguageCode

    }

    $Response = Invoke-GoogleTranslateAPIRequest -Method GET -Resource languages -Body $Body

    $Response = $Response.data.languages | Select-Object @{name='LanguageCode';expression='language'}, @{name='LanguageName';expression='name'}

    If ($LanguageCode) { 

        Write-Output $Response | Where-Object {$_.LanguageCode -eq $LanguageCode}

    }

    If ($LanguageName) {

        Write-Output $Response | Where-Object {$_.LanguageName -eq $LanguageName}

    }

    If ($LanguageCode -eq $Null -or $LanguageName -eq $Null) {

        Write-Output $Response
        
    }

}