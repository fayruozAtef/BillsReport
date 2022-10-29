import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/branch_details.dart';
import '../../domain/use_cases/get_branch_details_usecase.dart';

part 'branch_details_event.dart';
part 'branch_details_state.dart';

class BranchDetailsBloc extends Bloc<BranchDetailsEvent, BranchDetailsState> {
  BranchDetailsBloc(this.branchDetailsUseCase) : super(const BranchDetailsState()) {
    on<GetBranchDetailsEvent>(_getBranchDetail);
  }

  final GetBranchDetailsUseCase branchDetailsUseCase;

  FutureOr<void> _getBranchDetail(GetBranchDetailsEvent event, Emitter<BranchDetailsState> emit) async{
    final result =await branchDetailsUseCase(GetBranchDetailsParameters(event.branchId));
    result.fold((l) {
      emit(state.copyWith(
        branchDetailsState: RequestState.error,
        branchDetailsMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        branchDetailsData: r,
        branchDetailsState: RequestState.loaded,
      ));
    });
  }
}
