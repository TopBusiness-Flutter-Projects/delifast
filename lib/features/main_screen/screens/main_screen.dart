import 'package:delifast/core/utils/app_export.dart';
import 'package:delifast/features/main_screen/cubit/cubit.dart';
import 'package:delifast/features/main_screen/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../home/screens/home_screen.dart';
import '../../notifications/screens/notificationi.dart';
import '../../delivered/screens/delivered_screen.dart';
import '../../orders/screens/order_screen.dart';
import '../../setting/screens/menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        var cubit = context.read<MainCubit>();
        return SafeArea(
          child: Scaffold(
            body: IndexedStack(
              index: cubit.selectedIndex,
              children: [
                HomeScreen(),
                const OrderScreen(
                  isInMainScreen: true
                ),
                const DeliveredScreen(),
                const NotificaionScreen(),
                AccountScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xffCE0001),
              unselectedItemColor: Colors.grey,
              currentIndex: cubit.selectedIndex,
              onTap: cubit.onItemTapped,
              items: [
                 BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'.tr(),
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Image.asset(AppIcons.scanicon,
                          color: AppColors.white)),
                  label: 'Delivered'.tr(),
                ),
                 BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notifications'.tr(),
                ),
                 BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Account'.tr(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
