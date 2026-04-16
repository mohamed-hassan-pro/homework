# تعريف مصفوفة للفولدرات (Clean Architecture Structure)
$folders = @(
    "3_language_learning_app/lib/views",
    "3_language_learning_app/lib/routing",
    "3_language_learning_app/lib/utils",
    "3_language_learning_app/lib/views/home"
)

# تعريف مصفوفة للملفات المبدئية التي تريد إنشاءها فارغة
$files = @(
    "3_language_learning_app/lib/views/home_view.dart"
)

# بناء الفولدرات
foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
}

# بناء الملفات
foreach ($file in $files) {
    New-Item -ItemType File -Force -Path $file | Out-Null
}

Write-Host "تم بناء هيكل المشروع بنجاح يا مبدع! 🚀" -ForegroundColor Green