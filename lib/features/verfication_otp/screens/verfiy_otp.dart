import 'dart:async';

import 'package:delifast/core/utils/app_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final TextEditingController _pinController = TextEditingController();
  int _secondsLeft = 80;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsLeft > 0) {
          _secondsLeft--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("verification_code".tr(),
            style: TextStyle(color: Colors.black, fontSize: 18.sp)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              "Verification code",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "We've sent your verification code to\n+971 50 8304 5321",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: _pinController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: AppLanguages.verify,
                buttonColor: AppColors.primaryButton,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.mainRoute, (route) => false);
                  //    cubit.signupValidate(context);

//                                   if (cubit.formKey.currentState!.validate()) {
// cubit.login();
//                                   }
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: _secondsLeft > 0
                  ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                          "Resend code ",
                          style: TextStyle(color: Colors.grey),
                        ),
                      Text("${_secondsLeft ~/ 60}:${(_secondsLeft % 60).toString().padLeft(2, '0')}",
                        style: const TextStyle(color: Colors.red),),
                    ],
                  )
                  : TextButton(
                      onPressed: () {
                        // Add your resend code logic here
                        setState(() {
                          _secondsLeft = 80;
                          _startTimer();
                        });
                      },
                      child: const Text("Resend code"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
