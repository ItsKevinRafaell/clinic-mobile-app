import 'package:flutter/material.dart';
import 'package:flutter_clinicmobile_app_kevin/core/extensions/build_context_ext.dart';

import '../../../../core/assets/assets.gen.dart';
import '../../../../core/components/spaces.dart';
import '../../../../core/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/buttons.dart';
import 'premium_chat_page.dart';

class DetailDoctorPage extends StatelessWidget {
  const DetailDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          height: 77,
          width: context.deviceWidth,
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biaya Konsultasi",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    "Rp. 40.000",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                      color: Color(
                        0xff677294,
                      ),
                    ),
                  ),
                ],
              ),
              Button.filled(
                width: 120,
                height: 40,
                borderRadius: 10,
                onPressed: () {
                  context.push(const PremiumChatPage());
                },
                label: 'Chat Sekarang',
                fontSize: 12.0,
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  color: AppColors.primary,
                  child: Image.asset(
                    Assets.images.doctor1.path,
                    width: context.deviceWidth,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: context.deviceHeight * 0.45,
                  ),
                  padding: const EdgeInsets.all(24.0),
                  width: context.deviceWidth,
                  decoration: const BoxDecoration(
                    color: AppColors.lightBackground,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(
                        8,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "dr. Kiara Tasbiha",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                "Spesialis  Kandungan",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              const SpaceHeight(
                                10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xffF2C94C),
                                    size: 24.0,
                                  ),
                                  const SpaceWidth(
                                    8,
                                  ),
                                  const Text(
                                    "4.6 review (100 ulasan)",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SpaceWidth(
                                    16,
                                  ),
                                  Image.asset(
                                    Assets.icons.personHistory.path,
                                    width: 18,
                                    height: 18,
                                  ),
                                  const SpaceWidth(8),
                                  const Text(
                                    "8 tahun",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: SvgPicture.asset(
                              Assets.icons.chat.path,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(24),
                      const Text(
                        "Penghargaan dan Sertifikasi",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SpaceHeight(8),
                      item(
                        'Sertifikasi Ultrasonografi Kandungan dan Kebidanan',
                        'Asosiasi Ultrasonografi Indonesia',
                        '2016',
                      ),
                      const SpaceHeight(16),
                      item(
                        'Pelatihan Penanganan Gawat Darurat Kebidanan',
                        'Rumah Sakit Pusat Jakarta',
                        '2020',
                      ),
                      const SpaceHeight(24),
                      const Text(
                        "Tempat Praktik",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SpaceHeight(8),
                      const Text(
                        "Klinik Sehat Prima",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget item(String certification, String place, String year) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: CircleAvatar(
            radius: 4.0,
            backgroundColor: AppColors.grey.withOpacity(0.4),
          ),
        ),
        const SpaceWidth(8),
        Expanded(
          child: Text(
            "$certification \n$place \nTahun: $year",
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}