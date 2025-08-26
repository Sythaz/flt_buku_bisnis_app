import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/navigation/navigation_service.dart';
import '../dashboard/dashboard_page.dart';
import '../accounts/accounts_page.dart';
import '../reports/reports_page.dart';
import 'add_transaction_page.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  int _selectedIndex = 1; // Transactions tab

  // Dummy data for transactions
  final List<Map<String, dynamic>> _transactions = [
    {
      'id': 1,
      'title': 'Penjualan Produk A',
      'description': 'Penjualan produk kepada PT. ABC',
      'amount': 2500000,
      'type': 'income',
      'category': 'Sales Revenue',
      'date': DateTime.now().subtract(const Duration(hours: 2)),
      'account': 'Cash',
    },
    {
      'id': 2,
      'title': 'Pembelian Bahan Baku',
      'description': 'Pembelian material untuk produksi',
      'amount': 1200000,
      'type': 'expense',
      'category': 'Raw Materials',
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'account': 'Bank BCA',
    },
    {
      'id': 3,
      'title': 'Jasa Konsultasi',
      'description': 'Fee konsultasi bisnis Q1',
      'amount': 3000000,
      'type': 'income',
      'category': 'Service Revenue',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'account': 'Bank Mandiri',
    },
    {
      'id': 4,
      'title': 'Biaya Sewa Kantor',
      'description': 'Sewa kantor bulan ini',
      'amount': 4500000,
      'type': 'expense',
      'category': 'Office Rent',
      'date': DateTime.now().subtract(const Duration(days: 3)),
      'account': 'Bank BCA',
    },
    {
      'id': 5,
      'title': 'Komisi Penjualan',
      'description': 'Bonus komisi tim sales',
      'amount': 800000,
      'type': 'expense',
      'category': 'Commission',
      'date': DateTime.now().subtract(const Duration(days: 4)),
      'account': 'Cash',
    },
    {
      'id': 6,
      'title': 'Penjualan Online',
      'description': 'Penjualan melalui marketplace',
      'amount': 1800000,
      'type': 'income',
      'category': 'Online Sales',
      'date': DateTime.now().subtract(const Duration(days: 5)),
      'account': 'E-Wallet',
    },
    {
      'id': 7,
      'title': 'Biaya Listrik',
      'description': 'Tagihan listrik kantor',
      'amount': 650000,
      'type': 'expense',
      'category': 'Utilities',
      'date': DateTime.now().subtract(const Duration(days: 6)),
      'account': 'Bank BCA',
    },
    {
      'id': 8,
      'title': 'Refund Pelanggan',
      'description': 'Pengembalian dana ke pelanggan',
      'amount': 350000,
      'type': 'expense',
      'category': 'Refund',
      'date': DateTime.now().subtract(const Duration(days: 7)),
      'account': 'Cash',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.transactions),
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
          // Filter and Search Section
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.surface,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search transactions...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    // TODO: Show filter dialog
                  },
                ),
              ],
            ),
          ),

          // Transactions List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final transaction = _transactions[index];
                final isIncome = transaction['type'] == 'income';

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: isIncome
                          ? AppColors.income
                          : AppColors.expense,
                      child: Icon(
                        isIncome ? Icons.arrow_upward : Icons.arrow_downward,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      transaction['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          transaction['description'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Icon(
                                Icons.category,
                                size: 14,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                transaction['category'],
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Icon(
                                Icons.account_balance_wallet,
                                size: 14,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                transaction['account'],
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${isIncome ? '+' : '-'}${_formatCurrency(transaction['amount'].toDouble())}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: isIncome
                                  ? AppColors.income
                                  : AppColors.expense,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatDate(transaction['date']),
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      // TODO: Navigate to transaction detail
                      _showTransactionDetail(context, transaction);
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
              // Already on transactions
              break;
            case 2:
              NavigationService.pushReplacement(const AccountsPage());
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
          NavigationService.push(const AddTransactionPage());
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
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
      return 'Today ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    }
  }

  void _showTransactionDetail(
    BuildContext context,
    Map<String, dynamic> transaction,
  ) {
    final isIncome = transaction['type'] == 'income';

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
                  backgroundColor: isIncome
                      ? AppColors.income
                      : AppColors.expense,
                  child: Icon(
                    isIncome ? Icons.arrow_upward : Icons.arrow_downward,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${isIncome ? '+' : '-'}${_formatCurrency(transaction['amount'].toDouble())}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isIncome
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
            _buildDetailRow('Description', transaction['description']),
            _buildDetailRow('Category', transaction['category']),
            _buildDetailRow('Account', transaction['account']),
            _buildDetailRow('Date', _formatDate(transaction['date'])),
            _buildDetailRow('Type', isIncome ? 'Income' : 'Expense'),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                    onPressed: () {
                      Navigator.pop(context);
                      // TODO: Navigate to edit transaction
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _showDeleteConfirmation(context, transaction);
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

  void _showDeleteConfirmation(
    BuildContext context,
    Map<String, dynamic> transaction,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Transaction'),
          content: Text(
            'Are you sure you want to delete "${transaction['title']}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: Implement delete transaction
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Transaction deleted successfully'),
                  ),
                );
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ],
        );
      },
    );
  }
}
