import 'package:flutter/material.dart';
import 'package:flutter_clinicmobile_app_kevin/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app_kevin/core/extensions/string_ext.dart';
import 'package:flutter_clinicmobile_app_kevin/data/models/response/order_response_model.dart';
import 'package:flutter_clinicmobile_app_kevin/utils/convert.dart';

import '../../../../core/assets/assets.gen.dart';
import '../../../../core/components/spaces.dart';
import '../../../../core/constants/colors.dart';

class CardHistory extends StatelessWidget {
  final OrderModel order;
  const CardHistory({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 20,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Image.network(
                  order.patient!.image ?? "https://i.pravatar.cc/300",
                  width: 87.0,
                  height: 87.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SpaceWidth(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.service!,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      order.doctor!.name!,
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: Color(
                          0xffB0BEC3,
                        ),
                      ),
                    ),
                    const SpaceHeight(8),
                    Text(
                      "${Convert.formatToReadableDate(order.schedule.toString())}, Pukul ${Convert.formatToReadableTime(order.schedule.toString())}",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total Bayar",
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              order.price!.toString().currencyFormatRpV2,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff677294),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 24,
                          width: 77,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: order.status?.toLowerCase() == 'approved' ||
                                    order.status?.toLowerCase() == 'done'
                                ? const Color(0xff25B865).withOpacity(0.1)
                                : order.status?.toLowerCase() == 'canceled' ||
                                        order.status?.toLowerCase() ==
                                            'rejected'
                                    ? const Color(0xffFF6854).withOpacity(0.1)
                                    : order.status?.toLowerCase() == 'waiting'
                                        ? const Color(0xffF2C94C)
                                            .withOpacity(0.1)
                                        : const Color(0xff718096)
                                            .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: order.status?.toLowerCase() ==
                                              'approved' ||
                                          order.status?.toLowerCase() == 'done'
                                      ? const Color(
                                          0xff25B865) // Green for completed
                                      : order.status?.toLowerCase() ==
                                                  'canceled' ||
                                              order.status?.toLowerCase() ==
                                                  'rejected'
                                          ? const Color(
                                              0xffFF6854) // Red for cancelled
                                          : order.status?.toLowerCase() ==
                                                  'waiting'
                                              ? const Color(
                                                  0xffF2C94C) // Yellow for waiting
                                              : const Color(
                                                  0xff718096), // Gray for other status
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "${order.status}",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: order.status?.toLowerCase() ==
                                              'approved' ||
                                          order.status?.toLowerCase() == 'done'
                                      ? const Color(
                                          0xff25B865) // Green for completed
                                      : order.status?.toLowerCase() ==
                                                  'canceled' ||
                                              order.status?.toLowerCase() ==
                                                  'rejected'
                                          ? const Color(
                                              0xffFF6854) // Red for cancelled
                                          : order.status?.toLowerCase() ==
                                                  'waiting'
                                              ? const Color(
                                                  0xffF2C94C) // Yellow for waiting
                                              : const Color(
                                                  0xff718096), // Gray for other status
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
