import 'package:finger_print_and_pin_code/Pin%20Code/res/btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../FingerPrint Services/finger_print.dart';
import '../Pin Screen/pin_provider.dart';
import '../text_widget.dart';
import 'dot_field.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    final pinValue = Provider.of<PinProvider>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(text: "Sign In"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(children: [
            .03.ph,
            Align(
              alignment: Alignment.center,
              child: TextWidget(
                text: "Enter Pin",
                size: 35,
                color: AppColor.whiteColor,
              ),
            ),
            .04.ph,
            TextWidget(
              text: "Enter Your Pin Code",
              color: AppColor.greyColor,
            ),
            .16.ph,
            Consumer<PinProvider>(
              builder: (context, value, child) {
                return Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DigitHolder(
                          width: width,
                          index: 0,
                          selectedIndex: value.selectedindex,
                          code: value.code,
                        ),
                        DigitHolder(
                            width: width,
                            index: 1,
                            selectedIndex: value.selectedindex,
                            code: value.code),
                        DigitHolder(
                            width: width,
                            index: 2,
                            selectedIndex: value.selectedindex,
                            code: value.code),
                        DigitHolder(
                            width: width,
                            index: 3,
                            selectedIndex: value.selectedindex,
                            code: value.code),
                      ],
                    ));
              },
            ),
            .15.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                btn("1", () {
                  pinValue.addDigit(1, context);
                }),
                .12.pw,
                btn("2", () {
                  pinValue.addDigit(2, context);
                }),
                .12.pw,
                btn("3", () {
                  pinValue.addDigit(3, context);
                }),
              ],
            ),
            .1.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                btn("4", () {
                  pinValue.addDigit(4, context);
                }),
                .12.pw,
                btn("5", () {
                  pinValue.addDigit(5, context);
                }),
                .12.pw,
                btn("6", () {
                  pinValue.addDigit(6, context);
                }),
              ],
            ),
            .1.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                btn("7", () {
                  pinValue.addDigit(7, context);
                }),
                .12.pw,
                btn("8", () {
                  pinValue.addDigit(8, context);
                }),
                .12.pw,
                btn("9", () {
                  pinValue.addDigit(9, context);
                }),
              ],
            ),
            .1.ph,
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  btn("<", () {
                    pinValue.backspace();
                  }),
                  .12.pw,
                  btn("0", () {
                    pinValue.addDigit(0, context);
                  }),
                  .12.pw,
                  btnFingerprint(() async {
                    final iAuthenticated = await LocalAuth.authenticate();
                    if (iAuthenticated) {
                      // ignore: use_build_context_synchronously
                    }
                  })
                ]),
            .16.ph,
            Align(
              alignment: Alignment.center,
              child: TextWidget(
                text: "Enter Your Pin Code",
                color: Colors.grey,
              ),
            )
          ]),
        ));
  }
}

extension on num {
  SizedBox get ph => SizedBox(
        height: 40 * toDouble(),
      );
  // ignore: unused_element
  SizedBox get pw => SizedBox(
        width: 40 * toDouble(),
      );
}
