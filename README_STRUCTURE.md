# Flutter Bookkeeping App

Aplikasi mobile bookkeeping yang dikembangkan dengan Flutter menggunakan arsitektur Clean Architecture dan mengintegrasikan dengan backend Laravel Bookkeeping System.

## 📁 Struktur Project

Struktur folder mengikuti standar JagoFlutter dengan Clean Architecture:

```
lib/
├── core/                           # Core functionality
│   ├── constants/                  # Konstanta aplikasi
│   │   ├── app_constants.dart     # Konstanta umum
│   │   ├── app_colors.dart        # Definisi warna
│   │   └── app_strings.dart       # String constants
│   ├── themes/                     # Tema aplikasi
│   │   └── app_themes.dart        # Light & Dark themes
│   ├── routes/                     # Routing configuration
│   │   ├── app_routes.dart        # Route definitions
│   │   └── app_router.dart        # Router configuration
│   ├── extensions/                 # Dart extensions
│   │   ├── context_extensions.dart # BuildContext extensions
│   │   ├── string_extensions.dart  # String extensions
│   │   └── datetime_extensions.dart # DateTime extensions
│   ├── utils/                      # Utility functions
│   │   └── app_utils.dart         # Helper functions
│   └── errors/                     # Error handling
│       ├── failures.dart          # Failure classes
│       └── exceptions.dart        # Exception classes
│
├── data/                           # Data layer
│   ├── datasources/               # Data sources
│   │   ├── remote/               # API data sources
│   │   └── local/                # Local storage
│   ├── models/                    # Data models (JSON serializable)
│   └── repositories/              # Repository implementations
│
├── domain/                         # Domain layer (Business Logic)
│   ├── entities/                  # Domain entities
│   │   ├── user.dart             # User entity
│   │   ├── transaction.dart      # Transaction entity
│   │   ├── account.dart          # Account entity
│   │   └── category.dart         # Category entity
│   ├── repositories/              # Repository contracts
│   └── usecases/                  # Use cases/business logic
│
├── presentation/                   # Presentation layer
│   ├── pages/                     # App screens/pages
│   │   ├── auth/                 # Authentication pages
│   │   │   ├── login_page.dart   # Login screen
│   │   │   └── register_page.dart # Register screen
│   │   ├── dashboard/            # Dashboard pages
│   │   │   └── dashboard_page.dart # Main dashboard
│   │   ├── transactions/         # Transaction pages
│   │   │   ├── transactions_page.dart
│   │   │   └── add_transaction_page.dart
│   │   ├── accounts/             # Account pages
│   │   │   ├── accounts_page.dart
│   │   │   └── add_account_page.dart
│   │   └── reports/              # Report pages
│   │       └── reports_page.dart
│   ├── widgets/                   # Reusable widgets
│   │   ├── common/               # Common widgets
│   │   └── forms/                # Form widgets
│   └── blocs/                     # State management (BLoC)
│       ├── auth/                 # Authentication BLoC
│       ├── transaction/          # Transaction BLoC
│       └── dashboard/            # Dashboard BLoC
│
├── shared/                         # Shared utilities
│   ├── services/                  # Services (API, Storage, etc.)
│   └── helpers/                   # Helper classes
│
└── main.dart                      # Entry point

assets/
├── images/                        # Image assets
├── icons/                         # Icon assets
└── fonts/                         # Font assets
```

## 🏗️ Arsitektur

Project ini menggunakan **Clean Architecture** dengan pembagian layer:

### 1. **Presentation Layer**

- **Pages**: Halaman/screen aplikasi
- **Widgets**: Komponen UI yang dapat digunakan kembali
- **BLoCs**: State management menggunakan BLoC pattern

### 2. **Domain Layer**

- **Entities**: Object bisnis inti aplikasi
- **Repositories**: Kontrak untuk akses data
- **Use Cases**: Logic bisnis aplikasi

### 3. **Data Layer**

- **Models**: Data model dengan serialization
- **Data Sources**: Remote (API) dan Local (Database)
- **Repository Implementations**: Implementasi kontrak repository

### 4. **Core Layer**

- **Constants**: Konstanta aplikasi
- **Themes**: Konfigurasi tema
- **Routes**: Konfigurasi routing
- **Extensions**: Ekstensi Dart untuk kemudahan development
- **Utils**: Fungsi utility
- **Errors**: Penanganan error

## 📱 Fitur Utama

1. **Authentication**

   - Login & Register
   - Token management
   - Auto logout

2. **Dashboard**

   - Overview keuangan
   - Grafik income/expense
   - Recent transactions

3. **Transaction Management**

   - Add/Edit/Delete transactions
   - Income, Expense, Transfer
   - Category management

4. **Account Management**

   - Multiple account types (Cash, Bank, Credit Card)
   - Account balance tracking
   - Account transfers

5. **Reports**
   - Income & Expense reports
   - Profit & Loss statement
   - Balance sheet
   - Cash flow analysis

## 🛠️ Dependencies

### Production Dependencies

- **flutter_bloc**: State management
- **dio**: HTTP client
- **go_router**: Navigation
- **shared_preferences**: Local storage
- **intl**: Internationalization

### Development Dependencies

- **build_runner**: Code generation
- **json_serializable**: JSON serialization
- **retrofit_generator**: API client generation

## 🚀 Getting Started

1. **Clone repository**

```bash
git clone <repository-url>
cd flutter_bookkeeping_app
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Generate code**

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

4. **Run app**

```bash
flutter run
```

## 🔧 Backend Integration

Aplikasi ini terhubung dengan Laravel Bookkeeping System backend. Pastikan:

1. Backend Laravel sudah running
2. Update base URL di `lib/core/constants/app_constants.dart`
3. Sesuaikan endpoint API jika diperlukan

## 📋 TODO

- [ ] Implementasi authentication dengan backend
- [ ] Lengkapi CRUD operations
- [ ] Tambah validasi form
- [ ] Implementasi state management dengan BLoC
- [ ] Tambah unit tests
- [ ] Implementasi offline mode
- [ ] Tambah push notifications

## 🤝 Contributing

1. Fork repository
2. Create feature branch
3. Commit changes
4. Push ke branch
5. Create Pull Request

## 📄 License

MIT License - lihat file LICENSE untuk detail.

---

**Developed with ❤️ using Flutter & Clean Architecture**
