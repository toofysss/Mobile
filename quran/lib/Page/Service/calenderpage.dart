import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran/Page/setting.dart';
import 'package:quran/constant/root.dart';
import 'package:table_calendar/table_calendar.dart';

class ClaenderPageController extends GetxController {
  SettingController settingController = Get.put(SettingController());
  DateTime today = DateTime.now();
  get day => int.parse(settingController.genderDays);
  int index = 0;
  get listbool => [day != 0 ? true : false, day == 0 ? true : false];
  void onchange(DateTime selected) {
    today = selected;
    update();
  }
}

class ClaenderPage extends StatelessWidget {
  const ClaenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClaenderPageController>(
        init: ClaenderPageController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              title: Text("S11".tr),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                  size: Root.iconsize - 3,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCalendar(
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                      weekendStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    calendarStyle: CalendarStyle(
                        defaultTextStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                        weekendTextStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                        todayDecoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(.4),
                            shape: BoxShape.circle),
                        selectedDecoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(.6),
                            shape: BoxShape.circle)),
                    headerStyle: HeaderStyle(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        headerMargin: const EdgeInsets.only(
                          bottom: 25,
                        ),
                        titleTextStyle: TextStyle(
                            fontSize: Root.fontsize,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                        formatButtonVisible: false,
                        titleCentered: true),
                    availableGestures: AvailableGestures.all,
                    locale: Root.lang,
                    selectedDayPredicate: (day) =>
                        isSameDay(day, controller.today),
                    focusedDay: controller.today,
                    firstDay: DateTime.utc(1440, 1, 1),
                    lastDay: DateTime.utc(3000, 3, 14),
                    onDaySelected: (selectedDay, focusedDay) =>
                        controller.onchange(selectedDay),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text("6".tr,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Root.fontsize,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: ListTile(
                      selectedTileColor:
                          Theme.of(context).colorScheme.primary.withOpacity(.2),
                      selected: true,
                      contentPadding: const EdgeInsets.all(0),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.only(
                                topLeft: Root.lang == "en"
                                    ? const Radius.circular(15)
                                    : const Radius.circular(0),
                                topRight: Root.lang == "en"
                                    ? const Radius.circular(0)
                                    : const Radius.circular(15),
                                bottomRight: Root.lang == "en"
                                    ? const Radius.circular(0)
                                    : const Radius.circular(15),
                                bottomLeft: Root.lang == "en"
                                    ? const Radius.circular(15)
                                    : const Radius.circular(0))),
                        width: 10,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      title: Text(
                        DateFormat('EEE d/MMM', Root.lang).format(
                          controller.today,
                        ),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Root.fontsize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text("7".tr,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Root.fontsize,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: ListTile(
                      selected: true,
                      contentPadding: const EdgeInsets.all(0),
                      selectedTileColor:
                          Theme.of(context).colorScheme.primary.withOpacity(.2),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.only(
                                topLeft: Root.lang == "en"
                                    ? const Radius.circular(15)
                                    : const Radius.circular(0),
                                topRight: Root.lang == "en"
                                    ? const Radius.circular(0)
                                    : const Radius.circular(15),
                                bottomRight: Root.lang == "en"
                                    ? const Radius.circular(0)
                                    : const Radius.circular(15),
                                bottomLeft: Root.lang == "en"
                                    ? const Radius.circular(15)
                                    : const Radius.circular(0))),
                        width: 10,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      title: Text(
                        HijriCalendar.fromDate(controller.today
                                .add(Duration(days: controller.day)))
                            .toFormat('dd MMMM yyyy'),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Root.fontsize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
