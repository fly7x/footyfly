# FootyFly 🏆

**A premium football companion app** for iOS & Android.

Live scores • Upcoming matches • Players • Teams • Standings • News • Widgets

---

## Design Philosophy

FootyFly is designed to feel **premium, fast, and addictive** — the kind of app you open every day.

### Visual Identity
- **Dark-first** interface (charcoal + deep navy)
- High-contrast text for readability under any lighting
- Accent color: **Electric Emerald** (`#00E676`) — energy, pitch, victory
- Secondary accent: Soft cyan for live indicators
- Generous spacing, rounded cards, subtle depth
- Clean typography hierarchy
- Smooth micro-interactions and elegant loading states

### Core Principles
1. Information density without clutter
2. Live data should feel *alive*
3. One-handed friendly navigation
4. Beautiful empty states and error states
5. Widgets that actually look good on the home screen

---

## Features Roadmap

### Phase 1 – Foundation (Current)
- [x] Project structure & design system
- [ ] Beautiful Home screen (Today's matches + Live)
- [ ] Match detail page
- [ ] Bottom navigation
- [ ] Theme system (dark + light)

### Phase 2 – Core Football Data
- [ ] Live scores & fixtures
- [ ] League standings
- [ ] Team pages
- [ ] Player profiles & stats
- [ ] Favorites system

### Phase 3 – Enrichment
- [ ] News feed
- [ ] Push notifications
- [ ] Search
- [ ] iOS & Android home screen widgets

### Phase 4 – Polish & Store
- [ ] Onboarding
- [ ] Offline support
- [ ] Performance optimization
- [ ] App Store & Play Store release

---

## Tech Stack

| Layer            | Choice              |
|------------------|---------------------|
| Framework        | Flutter             |
| Language         | Dart                |
| State Management | Riverpod            |
| Networking       | Dio                 |
| Local Storage    | SharedPreferences + Hive |
| Backend (later)  | Firebase            |
| Football Data    | API-Football        |
| News             | NewsAPI / RSS       |

---

## Getting Started

### 1. Install Flutter
Follow the official guide: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)

### 2. Clone the repo
```bash
git clone https://github.com/fly7x/footyfly.git
cd footyfly
```

### 3. Get dependencies
```bash
flutter pub get
```

### 4. Run
```bash
flutter run
```

---

## Project Structure

```
lib/
├── main.dart
├── app.dart
├── core/
│   ├── theme/          # Design system
│   ├── constants/
│   ├── network/
│   └── utils/
├── features/
│   ├── home/
│   ├── match/
│   ├── team/
│   ├── player/
│   ├── standings/
│   ├── news/
│   └── favorites/
└── shared/
    ├── widgets/
    └── models/
```

---

## Design System

**Primary Background:** `#0B0F1A`  
**Card Background:** `#151B2D`  
**Surface Elevated:** `#1C2438`  
**Accent (Live / Primary):** `#00E676`  
**Live Pulse:** `#00F0FF`  
**Text Primary:** `#FFFFFF`  
**Text Secondary:** `#8B95A8`  
**Text Tertiary:** `#5A6478`  
**Danger / Red Card:** `#FF3B5C`  
**Warning / Yellow:** `#FFC107`

---

Made with ⚽ by fly7x
