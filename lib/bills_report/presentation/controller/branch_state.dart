

import 'package:bills_report/bills_report/domain/entities/report_summery.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/branch.dart';

class BranchState extends Equatable {
  final List<Branch> branches;
  final RequestState getBranchesState;
  final String getBranchesMessage;

  final ReportSummery reportSummery;
  final RequestState reportSummeryState;
  final String reportSummeryMessage;


  const BranchState({
     this.branches=const [],
     this.getBranchesState= RequestState.loading,
     this.getBranchesMessage='',
    this.reportSummery=const ReportSummery(totalNumberOfInvoices: 0, totalSalesAmount: 0),
    this.reportSummeryState=RequestState.loading,
    this.reportSummeryMessage='',
  });


  BranchState copyWith({
     List<Branch>? branches,
     RequestState? getBranchesState,
     String? getBranchesMessage,
     ReportSummery? reportSummery,
     RequestState? reportSummeryState,
     String? reportSummeryMessage,
  }) => BranchState(
        branches: branches?? this.branches,
        getBranchesState: getBranchesState ?? this.getBranchesState,
        getBranchesMessage: getBranchesMessage ?? this.getBranchesMessage,
        reportSummery: reportSummery??this.reportSummery,
        reportSummeryState: reportSummeryState ?? this.reportSummeryState,
        reportSummeryMessage: reportSummeryMessage ?? this.reportSummeryMessage,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        branches,
        getBranchesState,
        getBranchesMessage,
      ];
}

