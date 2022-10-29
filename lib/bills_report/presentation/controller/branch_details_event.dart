part of 'branch_details_bloc.dart';

abstract class BranchDetailsEvent extends Equatable {
  const BranchDetailsEvent();
}
class GetBranchDetailsEvent extends BranchDetailsEvent{
  final int branchId;

  const GetBranchDetailsEvent(this.branchId);

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
