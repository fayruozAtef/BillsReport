import 'package:bills_report/bills_report/domain/entities/report_summery.dart';

class ReportSummeryModel extends ReportSummery{
  const ReportSummeryModel({
    required super.totalNumberOfInvoices,
    required super.totalSalesAmount,
  });

  factory ReportSummeryModel.fromJson(Map<String, dynamic> json) =>
      ReportSummeryModel(
        totalNumberOfInvoices: json['TotalInvoices'].toInt(),
        totalSalesAmount: json['TotalSales'].toDouble(),
      );
}