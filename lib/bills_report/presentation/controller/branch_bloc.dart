import 'dart:async';
import 'package:bills_report/bills_report/domain/entities/report_summery.dart';
import 'package:bills_report/bills_report/domain/use_cases/get_branches_usecase.dart';
import 'package:bills_report/bills_report/domain/use_cases/get_report_summery_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../core/network/api_constances.dart';
import '../../../core/usecase/base_usecase.dart';
import '../../../core/utils/enums.dart';
import 'branch_event.dart';
import 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  BranchBloc(this.branchesUseCase,this.reportSummeryUserCase) : super(const BranchState()) {
    on<GetBranchEvent>(_getBranchesReport);
  }

  final GetBranchesUseCase branchesUseCase;
  final GetReportSummeryUserCase reportSummeryUserCase;
  FutureOr<void> _getBranchesReport(GetBranchEvent event, Emitter<BranchState> emit) async{
    final result=await branchesUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        getBranchesState: RequestState.error,
        getBranchesMessage: l.message,
        reportSummeryState: RequestState.error,
        reportSummeryMessage: l.message,

      ));
    }, (r) {
      emit(state.copyWith(
        branches: r.branches,
        reportSummery: r.summery,
        reportSummeryState: RequestState.loaded,
        getBranchesState: RequestState.loaded,
      ));
    });
  }

  /*FutureOr<void> _getReportSummery(GetReportSummery event, Emitter<BranchState> emit) async{
    final result=await reportSummeryUserCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        reportSummeryState: RequestState.error,
        reportSummeryMessage: l.message,
      ));
    }, (r) {
      ReportSummery rs=ReportSummery(totalNumberOfInvoices: r.totalNumberOfInvoices, totalSalesAmount: r.totalSalesAmount);
      emit(
          state.copyWith(
        reportSummery: rs,
        reportSummeryState: RequestState.loaded,
      ));
      print('object --> '+r.totalNumberOfInvoices.toString());

    });
  }*/

}

