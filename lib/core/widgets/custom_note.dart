
import '../utils/app_export.dart';
import '../../features/order_details/cubit/order_details_cubit.dart';

class CustomNoteWidget extends StatelessWidget {
  const CustomNoteWidget({
    super.key, required this.isText,
  });
  final bool isText;
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<OrderDetailsCubit,OrderDetailsState>(
        builder: (context, state) {
          return   Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.all(10.0.sp),
                child: const Text(
                  textAlign: TextAlign.center,
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          );
        });
  }
}