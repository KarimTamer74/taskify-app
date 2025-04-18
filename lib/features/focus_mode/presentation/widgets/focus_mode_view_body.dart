import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/shared_widgets/custom_elevated_button.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class FocusModeViewBody extends StatefulWidget {
  const FocusModeViewBody({super.key});

  @override
  State<FocusModeViewBody> createState() => _FocusModeViewBodyState();
}

class _FocusModeViewBodyState extends State<FocusModeViewBody> {
  Timer? _timer;
  int _seconds = 0;
  bool _isFocusing = false;
  bool _isPaused = false;
  final int _focusDuration = 3600;
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _startFocus() async {
    setState(() {
      _isFocusing = true;
      _isPaused = false;
      _seconds = 0;
    });

    await _audioPlayer.play(
      AssetSource('audios/focus_mode_audio.mp3'),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });

      if (_seconds >= _focusDuration) {
        _timer?.cancel();
        setState(() {
          _isFocusing = false;
        });
      }
    });
  }

  void _stopFocus() {
    _timer?.cancel();
    setState(() {
      _isFocusing = false;
      _isPaused = false;
      _seconds = 0;
    });
  }

  void _pauseFocus() {
    _timer?.cancel();
    setState(() {
      _isPaused = true;
    });
  }

  void _resumeFocus() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });

    setState(() {
      _isPaused = false;
    });
  }

  String get _formattedTime {
    final hours = (_seconds ~/ 3600).toString().padLeft(2, '0');

    final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  double get _progressValue {
    if (_seconds > _focusDuration) return 1.0;
    return _seconds / _focusDuration;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 8),
                ),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200.w,
                      height: 200.h,
                      child: CircularProgressIndicator(
                        value: _progressValue,
                        strokeWidth: 8,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.bluishClr),
                      ),
                    ),
                    Text(
                      _formattedTime,
                      style: AppStyles.textStyleBold32,
                    ),
                  ],
                ),
              ),
              30.vGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'While your focus mode is on, all of your notifications will be off',
                  style: AppStyles.greyTextStyle16,
                  textAlign: TextAlign.center,
                ),
              ),
              40.vGap,
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      text: _isFocusing ? 'Stop Focus' : 'Start Focus',
                      onPressed: _isFocusing ? _stopFocus : _startFocus,
                    ),
                  ),
                  10.hGap,
                  Expanded(
                    child: CustomElevatedButton(
                      backgroundColor: AppColors.darkPink,
                      text: _isPaused ? 'Resume Focus' : 'Pause Focus',
                      onPressed: () {
                        if (_isFocusing) {
                          _isPaused ? _resumeFocus() : _pauseFocus();
                        }
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
