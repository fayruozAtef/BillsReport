import 'package:bills_report/bills_report/domain/entities/branch_details.dart';

class BranchDetailsModel extends BranchDetails{
  const BranchDetailsModel({
    required super.salesAmount,
    required super.numOfInvoicesSales,
    super.totalTaxes =0.0,
    required super.numOfInvoicesTaxes,
    super.totalReturns=0.0,
    required super.numOfInvoicesReturns,
    super.totalDis=0.0,
    required super.numOfInvoicesDis,

  });

  factory BranchDetailsModel.fromJson(Map<String, dynamic> json) =>
      BranchDetailsModel(
        salesAmount: json['Item']['SalesAmount']?? 0.0,
        numOfInvoicesSales: json['Item']['NumOfInvoicesSales'] ?? 0,
        totalTaxes: json['Item']['totalTaxes'] ?? 0.0,
        numOfInvoicesTaxes: json['Item']['NumOfInvoicesTaxes'] ?? 0,
        totalReturns: json['Item']['totalReturns'] ?? 0.0,
        numOfInvoicesReturns: json['Item']['NumOfInvoicesReturns'] ?? 0,
        totalDis: json['Item']['totalDis'] ?? 0.0,
        numOfInvoicesDis: json['Item']['NumOfInvoicesDis'] ?? 0,
      );
}