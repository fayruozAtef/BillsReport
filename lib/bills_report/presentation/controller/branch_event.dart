import 'package:equatable/equatable.dart';

abstract class BranchEvent extends Equatable {
  const BranchEvent();
}

class GetBranchEvent extends BranchEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GetReportSummery extends BranchEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
