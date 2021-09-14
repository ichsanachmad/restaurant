import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/bloc/bloc.dart';
import 'package:restaurant/ui/home/components.dart';
import 'package:restaurant/ui/widgets/widget.dart';

class SettingScreen extends StatelessWidget {
  static const ROUTE = "/setting";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlarmSchedulingBloc>(
      create: (_) => AlarmSchedulingBloc(),
      child: SettingScreenContainer(),
    );
  }
}

class SettingScreenContainer extends StatefulWidget {
  @override
  State<SettingScreenContainer> createState() => _SettingScreenContainerState();
}

class _SettingScreenContainerState extends State<SettingScreenContainer> {
  @override
  void initState() {
    context.read<AlarmSchedulingBloc>().add(AlarmSchedulingEvent.CHECK_STATUS);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            TrioCircleDecoration(),
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, top: 64),
                  child: Text(
                    'Settings App',
                    style: TextExtension.titleStyle(textColor: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 2),
                  child: Text(
                    'Setting your app here..',
                    style: TextExtension.h2Style(textColor: Colors.grey),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 8,
                    bottom: 8,
                  ),
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 8,
                    bottom: 8,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Restaurant Reminder',
                        style: TextExtension.h2Style(
                          textColor: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: BlocBuilder<AlarmSchedulingBloc,
                              AlarmSchedulingState>(
                            builder: (context, state) {
                              var isScheduled = false;

                              if (state is AlarmSchedulingStatusCallbackState) {
                                isScheduled = state.status;
                              }

                              return Switch.adaptive(
                                value: isScheduled,
                                onChanged: (value) {
                                  if (Platform.isIOS) {
                                    customDialog(context);
                                  } else {
                                    if (isScheduled)
                                      context
                                          .read<AlarmSchedulingBloc>()
                                          .add(AlarmSchedulingEvent.TURN_OFF);
                                    else
                                      context
                                          .read<AlarmSchedulingBloc>()
                                          .add(AlarmSchedulingEvent.TURN_ON);
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.grey)],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
