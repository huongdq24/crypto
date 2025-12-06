# 💰 Crypto Portfolio Tracker

A beautiful and modern cryptocurrency portfolio tracking application built with Flutter.

## 📱 Features

- **Real-time Price Tracking**: Live cryptocurrency prices from CoinGecko API
- **Portfolio Management**: Track your crypto assets and total portfolio value
- **Interactive Charts**: View detailed price charts with multiple timeframes (Day, Week, Month, 3M, 6M, Year)
- **Market Analytics**: Monitor Low, High, Volume, and percentage changes
- **Top Coins**: Browse and analyze top 10 cryptocurrencies
- **Recommendations**: Get personalized coin recommendations
- **Beautiful UI**: Modern gradient design with smooth animations

## 🎨 Screenshots

### Main Portfolio Screen
- View total portfolio value with percentage gains
- Quick access to Assets list
- Recommended coins carousel
- Clean, gradient yellow theme

### Coin Details Screen
- Detailed coin information with live prices
- Interactive candlestick charts powered by Syncfusion
- Multiple timeframe selection (D, W, M, 3M, 6M, Y)
- Market statistics (Low, High, Volume)
- News section
- Add to portfolio functionality

## 🚀 Technologies Used

- **Framework**: Flutter 3.x
- **State Management**: StatefulWidget
- **API**: CoinGecko API (Free tier)
- **Charts**: 
  - Syncfusion Flutter Charts (Candlestick charts)
  - chart_sparkline (Mini line charts)
- **HTTP**: http package for API calls
- **UI Components**: Custom widgets with gradient designs

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.6
  syncfusion_flutter_charts: ^latest
  chart_sparkline: ^latest
```

## 🛠️ Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd crypto
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📊 API Information

This app uses the **CoinGecko API** (free tier):
- Base URL: `https://api.coingecko.com/api/v3/`
- No API key required
- Rate limiting: Please wait between requests
- Endpoints used:
  - `/coins/markets` - Get market data for coins
  - `/coins/{id}/ohlc` - Get OHLC data for charts

## 🎯 Project Structure

```
lib/
├── Model/
│   ├── coinModel.dart       # Coin data model
│   └── chartModel.dart      # Chart data model
├── View/
│   ├── home.dart           # Main portfolio screen
│   ├── selectCoin.dart     # Coin details screen
│   ├── Components/
│   │   ├── item.dart       # Asset list item widget
│   │   └── item2.dart      # Recommendation card widget
└── main.dart               # App entry point
```

## 🎨 Design Features

- **Gradient Backgrounds**: Beautiful yellow-gold gradient theme
- **Rounded Containers**: Smooth corners with proper shadows
- **Responsive Layout**: Adapts to different screen sizes
- **Smooth Animations**: Chart animations and transitions
- **Modern Typography**: Clear hierarchy and readable fonts
- **Color Coding**: Green for gains, Red for losses

## 📝 Notes

- This app uses a **free API**, so please avoid sending multiple rapid requests
- Internet connection is required for real-time data
- Charts may take a moment to load depending on network speed

## 👨‍💻 Developer

Built by a Final-year Software Engineering student with expertise in:
- Flutter & Dart Development
- Cross-platform Mobile Applications
- Clean Architecture & Design Patterns
- State Management (BLoC, Provider)
- Firebase Integration
- API Integration

## 📄 License

This project is created for educational purposes.

## 🚧 Future Enhancements

- [ ] Add user authentication
- [ ] Save portfolio data locally
- [ ] Push notifications for price alerts
- [ ] Multiple portfolio support
- [ ] Dark mode theme
- [ ] More detailed analytics
- [ ] Favorite coins feature

---

**Cryptocurrency Portfolio Tracker** - Track your crypto investments beautifully 💎
