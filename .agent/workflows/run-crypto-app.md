---
description: Hướng dẫn chạy dự án Crypto App
---

# Hướng dẫn chạy dự án Flutter Crypto

## Vấn đề hiện tại
Dự án đang gặp lỗi khi build Android do conflict giữa cấu hình Gradle và Flutter SDK.

## Giải pháp

### Phương án 1: Chạy trên Web Browser (TẠM THỜI - KHUYẾN NGHỊ)
Đây là cách nhanh nhất để test ứng dụng và các API:

```powershell
# 1. Clean project
flutter clean

# 2. Get dependencies
flutter pub get

# 3. Chạy trên Chrome
flutter run -d chrome
```

**Lưu ý**: Khi chạy trên web, bạn có thể nhìn thấy warning về CORS nhưng API CoinGecko vẫn hoạt động bình thường.

### Phương án 2: Fix Android build (KHUY ẾN NGHỊ)
Nếu bạn muốn chạy trên Android, cần cập nhật cấu hình:

```powershell
# 1. Cập nhật Kotlin version trong android/build.gradle
# Thay đổi: ext.kotlin_version = '1.6.10'
# Thành: ext.kotlin_version = '1.9.0'

# 2. Cập nhật compileSdk trong android/app/build.gradle đã được thực hiện

# 3. Clean và rebuild
flutter clean
flutter pub get
flutter run

```

### Phương án 3: Chạy trên Windows Desktop
```powershell
flutter run -d windows
```

## Test API với Postman
Xem file `POSTMAN_GUIDE.md` để biết cách test các API mà ứng dụng sử dụng.

### API chính:
1. **Danh sách coins:** `https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false`
2. **Biểu đồ OHLC:** `https://api.coingecko.com/api/v3/coins/bitcoin/ohlc?vs_currency=usd&days=7`

## Các lệnh hữu ích

```powershell
# Kiểm tra thiết bị khả dụng
flutter devices

# Kiểm tra trạng thái Flutter
flutter doctor -v

# List emulators
flutter emulators

 # Khởi động emulator
flutter emulators --launch <emulator_id>

# Chạy với verbose để xem chi tiết lỗi
flutter run -v

# Analyze code
flutter analyze

# Update dependencies
flutter pub upgrade
```

## Lưu ý
- **Rate Limiting**: CoinGecko free API giới hạn 50 calls/minute
- **Internet Required**: Ứng dụng cần kết nối internet để lấy dữ liệu crypto
- **Emulator**: Đảm bảo emulator có kết nối internet
