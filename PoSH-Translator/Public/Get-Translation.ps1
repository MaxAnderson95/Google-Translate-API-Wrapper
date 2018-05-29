Function Get-Translation {

    [CmdletBinding()]
    Param (

        [Parameter(Mandatory=$True,Position=0,ValueFromPipeline=$True)]
        [String[]]$SourceText,

        [Parameter(Mandatory=$True,Position=1)]
        [String]$TargetLanguage,

        [Parameter(Position=2)]
        [String]$SourceLanguage

    )

    Begin {

    }

    Process {

        ForEach ($String in $SourceText) {

            $Body = @{

                "q" = $String
                "target" = $TargetLanguage

            }

            If ($SourceLanguage) {

                $Body.Add("source",$SourceLanguage)

            }

            $Response = Invoke-GoogleTranslateAPIRequest -Method POST -Resource translate -Body $Body

            $Hash = [Ordered]@{

                "InputText" = $String
                "Translation" = $Response.data.translations.translatedText
                "TargetLanguage" = $TargetLanguage

            }

            If ($SourceLanguage) {

                $Hash.Add("SourceLanguage",$SourceLanguage)

            }

            $Obj = [PSCustomObject]$Hash

            Write-Output $Obj

        }

    }

    End {

    }

}