import 'package:base_structure_project/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/widgets/textformfield/textformfield_code_receive/textformfield_code_receive.dart';
import 'package:provider/provider.dart';

class CodeReceiveTextFormFieldsList extends StatelessWidget {
  const CodeReceiveTextFormFieldsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationLoginProvider>(
        builder: (context, authenticationLoginProvider, child) {
      return Wrap(
        children: [
          TextFormFieldCodeReceive(
            textController:
                authenticationLoginProvider.firstVerifiedCodeTextController!,
          ),
          TextFormFieldCodeReceive(
            textController:
                authenticationLoginProvider.secondVerifiedCodeTextController!,
          ),
          TextFormFieldCodeReceive(
            textController:
                authenticationLoginProvider.thirdVerifiedCodeTextController!,
          ),
          TextFormFieldCodeReceive(
            textController:
                authenticationLoginProvider.forthVerifiedCodeTextController!,
          ),
        ],
      );
    });
  }
}
