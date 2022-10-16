import 'package:bills_report/bills_report/domain/entities/report_summery.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/branch_model.dart';

class BillsReport extends Equatable{
  final List<BranchModel> branches;
  final ReportSummery summery;

  const BillsReport({
    required this.branches,
    required this.summery,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        branches,
        summery,
      ];
}