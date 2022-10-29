import 'package:equatable/equatable.dart';

class BranchDetails extends Equatable{

  final double salesAmount;
  final int numOfInvoicesSales;
  final double totalTaxes;
  final int numOfInvoicesTaxes;
  final double totalReturns;
  final int numOfInvoicesReturns;
  final double totalDis;
  final int numOfInvoicesDis;


  const BranchDetails({
    required this.salesAmount,
    required this.numOfInvoicesSales,
    this.totalTaxes =0.0,
    required this.numOfInvoicesTaxes,
    this.totalReturns=0.0,
    required this.numOfInvoicesReturns,
    this.totalDis=0.0,
    required this.numOfInvoicesDis,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        salesAmount,
        numOfInvoicesSales,
        totalTaxes,
        numOfInvoicesTaxes,
        totalReturns,
        numOfInvoicesReturns,
        totalDis,
        numOfInvoicesDis,
      ];
}