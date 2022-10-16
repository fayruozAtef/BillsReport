import 'package:bills_report/bills_report/data/models/report_summery_model.dart';
import 'package:bills_report/bills_report/domain/entities/bills_report.dart';
import 'package:bills_report/bills_report/domain/entities/report_summery.dart';

import 'branch_model.dart';

class BillsReportModel extends BillsReport{
  const BillsReportModel({
    required super.branches,
    required super.summery,
  });

  factory BillsReportModel.fromJson(Map<String, dynamic> json) =>
      BillsReportModel(
        branches: List<BranchModel>.from((json['data'] as List).map((e) => BranchModel.fromJson(e))),
        summery: ReportSummeryModel.fromJson(json['item']),
      );
}