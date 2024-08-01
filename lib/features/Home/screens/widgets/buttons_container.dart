import '../../../../core/utils/app_export.dart';

class OptionButton extends StatelessWidget {
  final String icon;
  final String label;

  const OptionButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
           width: 75.w,
           height: 80.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary,
              width: 2,
            ),
          ),
          child: Image.asset(
            icon,
            color: AppColors.primary,
           // size: 32,
          ),
        ),
       SizedBox(height: 2.h),
        Flexible(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}