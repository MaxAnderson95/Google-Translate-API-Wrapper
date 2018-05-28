Function Set-GoogleTranslateAPIKey {

    $ModulePath = Get-Module -Name PoSH-Translator | Select-Object -ExpandProperty ModuleBase
    $KeyFileName = "key.json"

    $Key = Get-Content "$ModulePath\$KeyFileName" -ErrorAction SilentlyContinue | ConvertFrom-JSON -ErrorAction SilentlyContinue

    If ($Key.APIKey -eq $null) {

        Write-Error "API key not found. Use Set-GoogleTranslateAPIKey to set it."

    }

}