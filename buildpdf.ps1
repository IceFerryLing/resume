param(
  [int]$Runs = 2
)

$ErrorActionPreference = "Stop"

if ($Runs -lt 1) {
  throw "Runs must be greater than or equal to 1."
}

$texFile = "main.tex"

if (-not (Test-Path -LiteralPath $texFile)) {
  throw "Cannot find $texFile."
}

Write-Host "Compiling $texFile to main.pdf ($Runs run(s))..."

for ($i = 1; $i -le $Runs; $i++) {
  Write-Host "XeLaTeX run $i/$Runs"
  & xelatex -interaction=nonstopmode -halt-on-error $texFile

  if ($LASTEXITCODE -ne 0) {
    throw "XeLaTeX failed on run $i."
  }
}

$artifactPatterns = @(
  "*.aux",
  "*.log",
  "*.out",
  "*.toc",
  "*.synctex.gz",
  "*.fls",
  "*.fdb_latexmk",
  "*.xdv",
  "*.bbl",
  "*.blg",
  "*.bcf",
  "*.run.xml",
  "*.idx",
  "*.ilg",
  "*.ind",
  "*.lof",
  "*.lot",
  "*.lol",
  "*.nav",
  "*.snm",
  "*.vrb",
  "*.???~"
)

Write-Host "Cleaning LaTeX auxiliary files..."

foreach ($pattern in $artifactPatterns) {
  Get-ChildItem -Path "." -File -Filter $pattern -ErrorAction SilentlyContinue |
    Remove-Item -Force -ErrorAction SilentlyContinue
}
