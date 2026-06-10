class PaymentMethod {
  final String id;
  final String name;
  final String icon;
  final List<String> options;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.icon,
    required this.options,
  });
}

final List<PaymentMethod> paymentMethods = [
  PaymentMethod(
    id: 'bank_transfer',
    name: 'Transfer Bank',
    icon: '🏦',
    options: ['BCA', 'Mandiri', 'BNI', 'BRI'],
  ),
  PaymentMethod(
    id: 'e_wallet',
    name: 'E-Wallet',
    icon: '📱',
    options: ['GoPay', 'OVO', 'DANA', 'ShopeePay'],
  ),
  PaymentMethod(
    id: 'credit_card',
    name: 'Kartu Kredit/Debit',
    icon: '💳',
    options: ['Visa', 'Mastercard', 'JCB'],
  ),
  PaymentMethod(
    id: 'virtual_account',
    name: 'Virtual Account',
    icon: '🏧',
    options: ['BCA VA', 'Mandiri VA', 'BNI VA', 'BRI VA'],
  ),
];