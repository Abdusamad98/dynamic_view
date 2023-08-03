import 'package:dynamic_view/cubits/dynamic_views_cubit.dart';
import 'package:dynamic_view/model/input_model.dart';
import 'package:dynamic_view/repository.dart';
import 'package:dynamic_view/widgets/universal_input_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DynamicViewPage extends StatelessWidget {
  const DynamicViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => DynamicViewsCubit(myRepository: MyRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dynamic views"),
        ),
        body: BlocBuilder<DynamicViewsCubit, DynamicViewsState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == FormzStatus.submissionSuccess) {

              List<InputModel> sendersContainer = state.dynamicFields
                  .where((element) => element.group == "SENDER")
                  .toList();

              List<InputModel> receiversContainer = state.dynamicFields
                  .where((element) => element.group == "RECEIVER")
                  .toList();

              List<InputModel> commonsContainer = state.dynamicFields
                  .where((element) => element.group == "COMMON")
                  .toList();

              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  getMyCustomContainer(Column(
                    children: [
                      Text("Sender info"),
                      ...List.generate(
                        sendersContainer.length,
                        (index) => UniversalInputView(
                          inputModel: sendersContainer[index],
                        ),
                      )
                    ],
                  )),
                  getMyCustomContainer(Column(
                    children: [
                      Text("Receiver info"),
                      ...List.generate(
                        receiversContainer.length,
                        (index) => UniversalInputView(
                          inputModel: receiversContainer[index],
                        ),
                      )
                    ],
                  )),
                  getMyCustomContainer(
                    Column(
                      children: [
                        Text("Common info"),
                        ...List.generate(
                          commonsContainer.length,
                          (index) => UniversalInputView(
                            inputModel: commonsContainer[index],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else
              return const Text("Error");
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<DynamicViewsCubit>(context).fetchDynamicFields();
          },
        ),
      ),
    );
  }
}

Widget getMyCustomContainer(Widget widget) {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              spreadRadius: 6,
              offset: Offset(2, 4),
              color: Colors.grey.withOpacity(0.3))
        ]),
    child: widget,
  );
}
