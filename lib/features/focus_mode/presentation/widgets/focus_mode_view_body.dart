import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/shared_widgets/custom_elevated_button.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
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
  String lastSession = '';

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
      lastSession = _formattedTime;
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Container(
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
              ),
              30.vGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                 AppStrings.focusModeDesc,
                  style: AppStyles.greyTextStyle16,
                  textAlign: TextAlign.center,
                ),
              ),
              40.vGap,
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      text: _isFocusing ? AppStrings.stopFocus : AppStrings.startFocus,
                      onPressed: _isFocusing ? _stopFocus : _startFocus,
                    ),
                  ),
                  10.hGap,
                  Expanded(
                    child: CustomElevatedButton(
                      backgroundColor: AppColors.darkPink,
                      text: _isPaused ? AppStrings.resumeFocus : AppStrings.pauseFocus,
                      onPressed: () {
                        if (_isFocusing) {
                          _isPaused ? _resumeFocus() : _pauseFocus();
                        }
                      },
                    ),
                  ),
                ],
              ),
              30.vGap,
              // Text("Last Focus Session", style: AppStyles.textStyleBold18),
              // CustomListTile(
              //   leadingIcon: AppIcons.flashIcon,
              //   title: lastSession,
              //   onTap: () {},
              // ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
