import 'package:finq/presentation/bloc/blocs.dart';
import 'package:finq/presentation/utils/passcode_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class TextFieldBox extends StatefulWidget {
//   final BlockTextChangedCallback onBlockTextChanged;
//   final FocusNode focusNode;
//   final int boxPosition;

//   TextFieldBox({
//     required this.onBlockTextChanged,
//     required this.focusNode,
//     required this.boxPosition,
//   });

//   @override
//   _TextFieldBoxState createState() => _TextFieldBoxState();
// }

// class _TextFieldBoxState extends State<TextFieldBox> {
//   TextEditingController? controller;
//   String previousText = "";
//   // PincodeCubit get _passcodeCubit => BlocProvider.of<PincodeCubit>(context);
//   // PincodeValidationCubit get _pincodeValidation =>
//   //     BlocProvider.of<PincodeValidationCubit>(context);

//   bool get _hasFocus => widget.focusNode.hasFocus;
//   TextEditingValue get _value => controller!.value;

//   @override
//   void didUpdateWidget(covariant TextFieldBox oldWidget) {
//     // TODO: implement didUpdateWidget
//     super.didUpdateWidget(oldWidget);
//     debugPrint('didUpdateWidget');
//   }

//   @override
//   void initState() {
//     super.initState();
//     controller = TextEditingController();
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     widget.focusNode.removeListener(() {});
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       child: Padding(
//         padding: const EdgeInsets.all(2.0),
//         child: Center(
//           child: Row(
//             children: [
//               Expanded(
//                 child: BlocListener<PincodeCubit, PincodeState>(
//                   listener: (context, state) {
//                     controller?.clear();
//                   },
//                   child: BlocListener<PincodeValidationCubit,
//                       PincodeValidationState>(
//                     listener: (context, state) {
//                       if (state is PinValidationProgress ||
//                           state is PincodeValidationFailed ||
//                           state is PincodeValidationIdle) {
//                         controller?.clear();
//                       }
//                     },
//                     child: TextField(
//                       focusNode: widget.focusNode,
//                       onTap: null,
//                       showCursor: false,
//                       enableInteractiveSelection: false,
//                       onChanged: (value) {
//                         if (value.isEmpty) {
//                           widget.onBlockTextChanged("", widget.boxPosition);
//                         } else {
//                           widget.onBlockTextChanged(
//                               value[value.length - 1], widget.boxPosition);
//                         }
//                       },
//                       textAlign: TextAlign.center,
//                       controller: controller,
//                       keyboardType: TextInputType.number,
//                       textInputAction: TextInputAction.go,
//                       decoration: InputDecoration(
//                         hintText: '',
//                         counterText: '',
//                         counterStyle: TextStyle(
//                           color: Colors.transparent,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       width: MediaQuery.of(context).size.width * 0.18,
//       decoration:
//           BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
//     );
//   }
// }
