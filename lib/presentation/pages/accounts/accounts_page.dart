import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/navigation/navigation_service.dart';
import '../dashboard/dashboard_page.dart';
import '../transactions/transactions_page.dart';
import '../reports/reports_page.dart';
import 'add_account_page.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  int _selectedIndex = 2; // Accounts tab

  // Dummy data for accounts
  final List<Map<String, dynamic>> _accounts = [
    {
      'id': 1,
      'name': 'Cash',
      'type': 'Asset',
      'balance': 5500000,
      'description': 'Kas tunai perusahaan',
      'isActive': true,
      'lastUpdated': DateTime.now().subtract(const Duration(hours: 1)),
    },
    {
      'id': 2,
      'name': 'Bank BCA',
      'type': 'Asset',
      'balance': 25000000,
      'description': 'Rekening BCA utama perusahaan',
      'isActive': true,
      'lastUpdated': DateTime.now().subtract(const Duration(hours: 3)),
    },
    {
      'id': 3,
      'name': 'Bank Mandiri',
      'type': 'Asset',
      'balance': 15750000,
      'description': 'Rekening Mandiri untuk operasional',
      'isActive': true,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      'id': 4,
      'name': 'E-Wallet (OVO)',
      'type': 'Asset',
      'balance': 2300000,
      'description': 'Saldo OVO untuk pembayaran digital',
      'isActive': true,
      'lastUpdated': DateTime.now().subtract(const Duration(hours: 5)),
    },
    {
      'id': 5,
      'name': 'Accounts Receivable',
      'type': 'Asset',
      'balance': 8500000,
      'description': 'Piutang dari pelanggan',
      'isActive': true,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 2)),
    },
    {
      'id': 6,
      'name': 'Inventory',
      'type': 'Asset',
      'balance': 12000000,
      'description': 'Nilai stok barang',
      'isActive': true,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      'id': 7,
      'name': 'Accounts Payable',
      'type': 'Liability',
      'balance': -4200000,
      'description': 'Hutang kepada supplier',
      'isActive': true,
      'lastUpdated': DateTime.now().subtract(const Duration(hours: 8)),
    },
    {
      'id': 8,
      'name': 'Loan Payable',
      'type': 'Liability',
      'balance': -15000000,
      'description': 'Pinjaman bank jangka panjang',
      'isActive': true,
      'lastUpdated': DateTime.now().subtract(const Duration(days: 5)),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.accounts),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            NavigationService.pushReplacement(const DashboardPage());
          },
        ),
      ),
      body: Column(
        children: [
          // Summary Cards
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    'Total Assets',
                    _getTotalByType('Asset'),
                    AppColors.income,
                    Icons.trending_up,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSummaryCard(
                    'Total Liabilities',
                    _getTotalByType('Liability'),
                    AppColors.expense,
                    Icons.trending_down,
                  ),
                ),
              ],
            ),
          ),

          // Filter Tabs
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterChip('All', true),
                const SizedBox(width: 8),
                _buildFilterChip('Assets', false),
                const SizedBox(width: 8),
                _buildFilterChip('Liabilities', false),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Accounts List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _accounts.length,
              itemBuilder: (context, index) {
                final account = _accounts[index];
                final isAsset = account['type'] == 'Asset';
                final balance = account['balance'].toDouble();
                final isPositive = balance >= 0;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: isAsset
                          ? AppColors.primary
                          : AppColors.secondary,
                      child: Icon(
                        isAsset
                            ? Icons.account_balance_wallet
                            : Icons.credit_card,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      account['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(account['description']),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: isAsset
                                    ? AppColors.income.withValues(alpha: 0.1)
                                    : AppColors.expense.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                account['type'],
                                style: TextStyle(
                                  color: isAsset
                                      ? AppColors.income
                                      : AppColors.expense,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Updated ${_formatDate(account['lastUpdated'])}',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _formatCurrency(balance.abs()),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: isPositive
                                ? AppColors.income
                                : AppColors.expense,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: account['isActive']
                                ? AppColors.success
                                : AppColors.error,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            account['isActive'] ? 'Active' : 'Inactive',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      _showAccountDetail(context, account);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Navigate to respective pages
          switch (index) {
            case 0:
              NavigationService.pushReplacement(const DashboardPage());
              break;
            case 1:
              NavigationService.pushReplacement(const TransactionsPage());
              break;
            case 2:
              // Already on accounts
              break;
            case 3:
              NavigationService.pushReplacement(const ReportsPage());
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: AppStrings.dashboard,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: AppStrings.transactions,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: AppStrings.accounts,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: AppStrings.reports,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationService.push(const AddAccountPage());
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  double _getTotalByType(String type) {
    return _accounts
        .where((account) => account['type'] == type)
        .fold(0.0, (sum, account) => sum + account['balance'].toDouble().abs());
  }

  Widget _buildSummaryCard(
    String title,
    double amount,
    Color color,
    IconData icon,
  ) {
    return Card(
      elevation: 4,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              color.withValues(alpha: 0.1),
              color.withValues(alpha: 0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: color, size: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatCurrency(amount),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        // TODO: Implement filter functionality
      },
      selectedColor: AppColors.primary.withValues(alpha: 0.2),
      backgroundColor: AppColors.surface,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }

  String _formatCurrency(double amount) {
    return 'Rp ${amount.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match.group(1)}.')}';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes}m ago';
      }
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'yesterday';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  void _showAccountDetail(BuildContext context, Map<String, dynamic> account) {
    final isAsset = account['type'] == 'Asset';
    final balance = account['balance'].toDouble();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: isAsset
                      ? AppColors.primary
                      : AppColors.secondary,
                  child: Icon(
                    isAsset ? Icons.account_balance_wallet : Icons.credit_card,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _formatCurrency(balance.abs()),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: balance >= 0
                              ? AppColors.income
                              : AppColors.expense,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildDetailRow('Description', account['description']),
            _buildDetailRow('Type', account['type']),
            _buildDetailRow(
              'Status',
              account['isActive'] ? 'Active' : 'Inactive',
            ),
            _buildDetailRow(
              'Last Updated',
              _formatDetailDate(account['lastUpdated']),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                    onPressed: () {
                      Navigator.pop(context);
                      // context.go(AppRoutes.editAccount);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.history, color: Colors.white),
                    label: const Text(
                      'History',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // TODO: Navigate to account history
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDetailDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
