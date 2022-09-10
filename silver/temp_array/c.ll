define dso_local i64* @array_get(%struct.array* noundef %0, i64 noundef %1) #0 {
  %3 = alloca %struct.array*, align 8
  %4 = alloca i64, align 8
  store %struct.array* %0, %struct.array** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %struct.array*, %struct.array** %3, align 8
  %6 = getelementptr inbounds %struct.array, %struct.array* %5, i32 0, i32 2
  %7 = load i64*, i64** %6, align 8
  %8 = load i64, i64* %4, align 8
  %9 = getelementptr inbounds i64, i64* %7, i64 %8
  ret i64* %9
}

define dso_local i64* @array_get(%struct.array* noundef %0, i64 noundef %1) #0 {
  %3 = alloca %struct.array*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64*, align 8
  store %struct.array* %0, %struct.array** %3, align 8
  store i64 %1, i64* %4, align 8
  %6 = load %struct.array*, %struct.array** %3, align 8
  %7 = getelementptr inbounds %struct.array, %struct.array* %6, i32 0, i32 2
  %8 = load i64*, i64** %7, align 8
  store i64* %8, i64** %5, align 8
  %9 = load i64*, i64** %5, align 8
  %10 = load i64, i64* %4, align 8
  %11 = getelementptr inbounds i64, i64* %9, i64 %10
  ret i64* %11
}
