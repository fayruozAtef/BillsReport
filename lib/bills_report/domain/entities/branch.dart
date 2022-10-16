import 'package:equatable/equatable.dart';

class Branch extends Equatable{
  final int branchId;
  final String name1;
  final int numberOfInvoices;
  final double salesAmount;

  const Branch({
    required this.branchId,
    required this.name1,
    required this.numberOfInvoices,
    required this.salesAmount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [branchId,name1, numberOfInvoices, salesAmount];
}