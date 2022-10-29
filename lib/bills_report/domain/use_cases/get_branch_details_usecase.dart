import 'package:bills_report/bills_report/domain/entities/branch_details.dart';
import 'package:bills_report/bills_report/domain/repository/basic_branch_repository.dart';
import 'package:bills_report/core/error/failure.dart';
import 'package:bills_report/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetBranchDetailsUseCase extends BaseUseCase<BranchDetails,GetBranchDetailsParameters>{
  final BasicBranchRepository basicBranchRepository;

  GetBranchDetailsUseCase(this.basicBranchRepository);

  @override
  Future<Either<Failure, BranchDetails>> call(GetBranchDetailsParameters branch) async{
    return await basicBranchRepository.getBranchDetails(branch);
  }

}

class GetBranchDetailsParameters extends Equatable{
  final int branchId;

   const GetBranchDetailsParameters(this.branchId);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}