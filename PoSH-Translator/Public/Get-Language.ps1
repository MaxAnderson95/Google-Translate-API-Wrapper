Function Get-Language {

    [CmdletBinding()]
    Param (

        [String]$LocalizedResultsLanguageCode = 'en'

    )

    $Body = @{

        'target' = $LocalizedResultsLanguageCode

    }

    $Response = Invoke-GoogleTranslateAPIRequest -Method GET -Resource languages -Body $Body

    Write-Output $Response.data.languages | Select @{name='LanguageCode';expression='language'}, @{name='LanguageName';expression='name'}

}