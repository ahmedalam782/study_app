import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../theme/app_colors.dart';
import '../../theme/styles.dart';

class ResendTimer extends StatefulWidget {
  const ResendTimer({super.key, required this.onResend});
  final Function() onResend;
  @override
  ResendTimerState createState() => ResendTimerState();
}

class ResendTimerState extends State<ResendTimer> {
  int _remainingSeconds = 30;
  int _timerCount = 1;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _handleResend() {
    setState(() {
      _remainingSeconds += 30 * _timerCount;
      _timerCount++;
    });

    if (_timer == null || !_timer!.isActive) {
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _timer == null || !_timer!.isActive
          ? () {
              _handleResend();
              widget.onResend();
            }
          : null,
      child: Text(
        _remainingSeconds > 0
            ? 'custom_widget.resend'.tr(args: [_remainingSeconds.toString()])
            : 'custom_widget.resend_title'.tr(),
        style: Styles.light14.copyWith(color: AppColors.primerColor),
      ),
    );
  }
}
