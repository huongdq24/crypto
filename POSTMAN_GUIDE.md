# Hướng dẫn Test API với Postman

## APIs được sử dụng trong ứng dụng Crypto

### 1. API lấy danh sách Cryptocurrency
**Endpoint:** `GET https://api.coingecko.com/api/v3/coins/markets`

**Parameters:**
- `vs_currency`: usd
- `order`: market_cap_desc
- `per_page`: 100
- `page`: 1
- `sparkline`: false

**Full URL:**
```
https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false
```

**Cách test trong Postman:**
1. Mở Postman
2. Tạo New Request
3. Chọn method: GET
4. Paste URL trên vào address bar
5. Click Send
6. Xem response trả về danh sách các đồng crypto với thông tin: giá, market cap, volume...

---

### 2. API lấy dữ liệu biểu đồ OHLC (Open, High, Low, Close)
**Endpoint:** `GET https://api.coingecko.com/api/v3/coins/{id}/ohlc`

**Parameters:**
- `id`: bitcoin (hoặc ethereum, cardano,...)
- `vs_currency`: usd
- `days`: 1, 7, 30, 90, 180, 365

**Ví dụ URLs:**
```
https://api.coingecko.com/api/v3/coins/bitcoin/ohlc?vs_currency=usd&days=7
https://api.coingecko.com/api/v3/coins/ethereum/ohlc?vs_currency=usd&days=30
```

**Cách test trong Postman:**
1. Tạo New Request
2. Chọn method: GET
3. Paste một trong các URL trên
4. Click Send
5. Xem response trả về array của [timestamp, open, high, low, close]

---

## Lưu ý quan trọng

### Rate Limiting
CoinGecko Free API có giới hạn request:
- **50 calls/minute** for free tier
- Nếu gửi quá nhiều request, bạn sẽ nhận lỗi 429 (Too Many Requests)
- Đợi 1-2 phút trước khi thử lại

### Headers
Không cần authentication header cho CoinGecko free API, chỉ cần:
```
Content-Type: application/json
Accept: application/json
```

---

## Các coin ID phổ biến để test
- bitcoin
- ethereum
- cardano
- binancecoin
- solana
- polkadot
- dogecoin
- ripple
