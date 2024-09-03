import 'package:flutter/material.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/widgets/center_settings_list_item.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/widgets/custom_show_bottom_sheet.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/widgets/gas_show_bottom_sheet.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/widgets/location_show_bottom_sheet.dart';

class CentersettingsViewBody extends StatelessWidget {
  const CentersettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CenterSettingsListItem(
            title: 'Center Name',
            icon: Icons.store,
            onTap: () {
              customShowBottomSheet(context,
                  lable: 'Center name',
                  onSavePressed: () {},
                  onChanged: (value) {});
            },
          ),
          CenterSettingsListItem(
            title: 'Center Phone',
            icon: Icons.phone,
            onTap: () {
              customShowBottomSheet(context,
                  lable: 'Center phone',
                  onSavePressed: () {},
                  onChanged: (value) {});
            },
          ),
          CenterSettingsListItem(
            title: 'location',
            icon: Icons.location_on,
            onTap: () {
              locationShowBottomSheet(
                context,
                onSavePressed: () {},
              );
            },
          ),
          CenterSettingsListItem(
            title: 'My Gas',
            icon: Icons.gas_meter,
            onTap: () {
              gasShowBottomSheet(
                context,
                onSavePressed: () {},
              );
            },
          ),
          CenterSettingsListItem(
            title: 'Open at',
            icon: Icons.schedule,
            onTap: () {
              customShowBottomSheet(context,
                  lable: 'Opening time',
                  onSavePressed: () {},
                  onChanged: (value) {},
                  isTiming: true);
            },
          ),
          CenterSettingsListItem(
            title: 'Close at',
            icon: Icons.lock_clock,
            onTap: () {
              customShowBottomSheet(context,
                  lable: 'Closing time',
                  onSavePressed: () {},
                  onChanged: (value) {},
                  isTiming: true);
            },
          ),
          CenterSettingsListItem(
            title: 'Cancelation Duration',
            icon: Icons.timer_off_outlined,
            onTap: () {
              customShowBottomSheet(context,
                  lable: 'Cancelation Duration (in hours)',
                  onSavePressed: () {},
                  onChanged: (value) {},
                  maxLength: 2,
                  keyboardType: TextInputType.number);
            },
          ),
        ],
      ),
    );
  }
}
