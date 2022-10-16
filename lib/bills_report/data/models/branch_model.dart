import 'package:bills_report/bills_report/domain/entities/branch.dart';

class BranchModel extends Branch{
  const BranchModel({
    required super.branchId,
    required super.name1,
    required super.numberOfInvoices,
    required super.salesAmount,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        branchId: json['BranchID'].toInt(),
        name1: json['Name1'].toString(),
        numberOfInvoices: json['NumOfInvoices'].toInt(),
        salesAmount: json['SalesAmount'].toDouble(),
      );
}