import 'package:equatable/equatable.dart';

class ReportSummery extends Equatable{

  final int totalNumberOfInvoices;
  final double totalSalesAmount;

  const ReportSummery({
    required this.totalNumberOfInvoices,
    required this.totalSalesAmount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [totalNumberOfInvoices,totalSalesAmount];

}