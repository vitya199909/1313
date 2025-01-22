param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)
    $content = Get-Content -Path $FilePath
    $content | ForEach-Object { $_ }
