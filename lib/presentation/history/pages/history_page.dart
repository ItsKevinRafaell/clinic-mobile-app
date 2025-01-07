import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinicmobile_app_kevin/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app_kevin/presentation/history/bloc/patient_history/patient_history_bloc.dart';
import 'package:flutter_clinicmobile_app_kevin/presentation/history/widgets/card_history.dart';

import '../../../../core/components/spaces.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/empty_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    context
        .read<PatientHistoryBloc>()
        .add(PatientHistoryEvent.getOrdersPatient());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1469F0),
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: context.deviceWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondary,
                    Color(0xff1469F0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: const Center(
                child: Text(
                  "Riwayat Chat & Telemedis",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SpaceHeight(14),
            BlocBuilder<PatientHistoryBloc, PatientHistoryState>(
                builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const SizedBox.shrink();
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, success: (data) {
                if (data.data!.isEmpty) {
                  return const Center(child: EmptyWidget());
                }

                return ListView.separated(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SpaceHeight(10);
                    },
                    itemCount: data.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardHistory(
                        order: data.data![index],
                      );
                    });
              });
            })
            // const Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 20,
            //   ),
            //   child: CardHistory(),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: context.deviceHeight * 0.2, left: 20, right: 20),
            //   child: const EmptyWidget(),
            // ),
          ],
        ),
      ),
    );
  }
}
