$files = Get-ChildItem -Filter "img_*.jpg" | Sort-Object Name
$i = 1
foreach ($f in $files) {
    Rename-Item $f.FullName -NewName ("tmp_$i.jpg")
    $i++
}
Get-ChildItem -Filter "tmp_*.jpg" | ForEach-Object {
    $num = $_.Name -replace 'tmp_(\d+)\.jpg','$1'
    Rename-Item $_.FullName -NewName ("$num.jpg")
}