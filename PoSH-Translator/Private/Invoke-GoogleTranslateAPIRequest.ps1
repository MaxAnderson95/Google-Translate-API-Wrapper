Function Invoke-GoogleTranslateAPIRequest {

    [CmdletBinding()]
    Param (

        [Parameter(Position=0)]
        [String]$Method,

        [Parameter(Position=1)]
        [String]$Resource,

        [Parameter(Position=2)]
        [PSCustomObject]$Body

    )

    $BaseURI = 'https://translation.googleapis.com/language/translate/v2'

    $APIKey = (Get-GoogleTranslateAPIKey).APIKey

    If ($APIKey -eq $Null) {Break}
    
    Switch ($Resource) {

        'translate' {

            $URI = "$BaseURI`?key=$APIKey"

        }

        'detect' {

            $URI = "$BaseURI/detect?key=$APIKey"

        }

        'languages' {

            $URI = "$BaseURI/languages?key=$APIKey"

        }

    }

    $Response = Invoke-RestMethod -Method $Method -Uri $URI -Body $Body

    Write-Output $Response

}