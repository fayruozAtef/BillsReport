part of 'branch_details_bloc.dart';

class BranchDetailsState extends Equatable {
  final BranchDetails? branchDetailsData;
  final RequestState branchDetailsState;
  final String branchDetailsMessage;


  const BranchDetailsState({
    this.branchDetailsData,
    this.branchDetailsState=RequestState.loading,
    this.branchDetailsMessage='',
  });
  BranchDetailsState copyWith({
    BranchDetails? branchDetailsData,
    RequestState? branchDetailsState,
    String? branchDetailsMessage,
  }) => BranchDetailsState(
        branchDetailsData: branchDetailsData ?? this.branchDetailsData,
        branchDetailsState: branchDetailsState ?? this.branchDetailsState,
        branchDetailsMessage: branchDetailsMessage ?? this.branchDetailsMessage,);

  @override
  // TODO: implement props
  List<Object?> get props => [
        branchDetailsData,
        branchDetailsState,
        branchDetailsMessage,
      ];
}
