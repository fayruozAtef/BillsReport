import 'dart:async';
import 'package:bills_report/bills_report/domain/use_cases/get_branches_usecase.dart';
import 'package:bloc/bloc.dart';
import '../../../core/usecase/base_usecase.dart';
import '../../../core/utils/enums.dart';
import 'branch_event.dart';
import 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  BranchBloc(this.branchesUseCase,) : super(const BranchState()) {
    on<GetBranchEvent>(_getBranchesReport);
  }

  final GetBranchesUseCase branchesUseCase;
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


}

