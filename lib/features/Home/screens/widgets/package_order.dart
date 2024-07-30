import '../../../../core/utils/app_export.dart';

class PackageTrackingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.card_giftcard, color: Colors.orange),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blue Flying Shoes',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tracking ID:94756294',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildLocationRow(
              icon: Icons.radio_button_checked_rounded,
              color: Colors.grey,
              text: 'From',
              location: '750 Ar Rutab St, Dubai, UAE',
            ),
            _buildDottedLine(),
            _buildLocationRow(
              icon: Icons.radio_button_checked_rounded,
              color: Colors.red,
              text: 'Shipped to',
              location: '888 Al Nahyan, Abu Dhabi, UAE',
            ),
            SizedBox(height: 20),
            Divider(height: 6.h,thickness: 1,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Status: Your package is new',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow({
    required IconData icon,
    required Color color,
    required String text,
    required String location,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 20),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildDottedLine() {
    return Container(
      height: 30,
      width: 1,
      margin: EdgeInsets.only(left: 10),
      child: CustomPaint(
        painter: DottedLinePainter(),
      ),
    );
  }
}
class PackageTrackingCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.card_giftcard, color: Colors.orange),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blue Flying Shoes',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tracking ID:94756294',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildLocationRow(
              icon: Icons.radio_button_checked_rounded,
              color: Colors.grey,
              text: 'From',
              location: '750 Ar Rutab St, Dubai, UAE',
            ),
            _buildDottedLine(),
            _buildLocationRow(
              icon: Icons.radio_button_checked_rounded,
              color: Colors.red,
              text: 'Shipped to',
              location: '888 Al Nahyan, Abu Dhabi, UAE',
            ),
            SizedBox(height: 20),
            Divider(height: 6.h,thickness: 1,),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(child:Image.asset(AppImages.walletPhoto)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text("Abdulah",style:TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700)),
                        Text("Provider",style:TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400)),
                      ],),
                    ),
                    Spacer(),
                    Row(children: [
                      Text("Total:500",style:TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700)),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Sr",style:TextStyle(fontSize: 14.sp,)),
                      ),

                    ],)
                  ],
                )
            ),
          ],
        ),
      ),
    );

  }

  Widget _buildLocationRow({
    required IconData icon,
    required Color color,
    required String text,
    required String location,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 20),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildDottedLine() {
    return Container(
      height: 30,
      width: 1,
      margin: EdgeInsets.only(left: 10),
      child: CustomPaint(
        painter: DottedLinePainter(),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const dashHeight = 5;
    const dashSpace = 3;
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}