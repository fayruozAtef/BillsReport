import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/branch.dart';
import '../controller/branch_bloc.dart';
import '../controller/branch_state.dart';
import '../screens/branch_details_screen.dart';

class DataTableBody extends StatelessWidget {
  const DataTableBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchBloc, BranchState>(
     buildWhen: (previous, current)=>previous.getBranchesState !=current.getBranchesState,
     builder: (context, state) {
      switch(state.getBranchesState) {
        case RequestState.loading:
          return const Center(child: CircularProgressIndicator(),);
        case RequestState.loaded:
          return DataTable(
            columns: const [
              DataColumn(
                  numeric: false,
                  label: Text('الفرع',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal))),
              DataColumn(
                  numeric: true,
                  label: Text('عدد الفواتير',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal))),
              DataColumn(
                  numeric: true,
                  label: Text('المبيعات',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal))),
            ],
            rows: state.branches.map((e) => buildDataRow(e, state.branches.indexOf(e), context)).toList(),
          );
        case RequestState.error:
          return Expanded(child: Text(state.getBranchesMessage));
      }
    });
  }
  DataRow buildDataRow(Branch branch, int index, BuildContext context){
    return DataRow(
        color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return (index%2==0)? Colors.teal[100]: null;
            }),
        cells: [
          DataCell(Text(branch.name1,overflow: TextOverflow.ellipsis, maxLines: 1,),onTap: (){_navigateToDetails(context,branch);}),
          DataCell(Center(child: Text("${branch.numberOfInvoices}",overflow: TextOverflow.ellipsis,)),onTap: (){_navigateToDetails(context,branch);}),
          DataCell(Center(child: Text("${branch.salesAmount}",overflow: TextOverflow.ellipsis, )),onTap: (){_navigateToDetails(context,branch);}),
        ]);
  }

  void _navigateToDetails(BuildContext context,Branch branch) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BranchDetailsScreen(branch: branch,), ));
  }
}
