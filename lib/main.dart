import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FairMeetingScreen(),
    );
  }
}

class FairMeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'FAIR',
                    style: TextStyle(
                      color: Color(0xFFD9C189),
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'MEETING',
                    style: TextStyle(
                      color: Color(0xFFD9C189),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 15.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                  children: [
                    _buildMenuButton(
                      context: context,
                      label: '약속 만들기',
                      subLabel1: '            간편하게',
                      subLabel2: '약속 장소 정하기',
                      icon: Icons.calendar_today,
                      color: Colors.white,
                      textColor: Colors.black,
                      iconColor: Colors.black,
                    ),
                    _buildMenuButton(
                      context: context,
                      label: '약속 캘린더',
                      subLabel1: '내 약속 확인하기',
                      subLabel2: '',
                      icon: Icons.event_available,
                      color: Colors.orange.shade200,
                    ),
                    _buildMenuButton(
                      context: context,
                      label: '내 정보',
                      subLabel1: '개인정보 수정',
                      subLabel2: '',
                      icon: Icons.person,
                      color: Colors.orange.shade200,
                    ),
                    _buildMenuButton(
                      context: context,
                      label: '환경설정',
                      subLabel1: '앱 설정 관리',
                      subLabel2: '',
                      icon: Icons.settings,
                      color: Colors.white,
                      textColor: Colors.black,
                      iconColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required BuildContext context,
    required String label,
    required String subLabel1,
    required String subLabel2,
    required IconData icon,
    required Color color,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
  }) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label 버튼을 눌렀습니다.')),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(4),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 4, left: 4),
              child: Icon(icon, size: 25, color: iconColor),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 4, bottom: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    subLabel1,
                    style: TextStyle(
                      fontSize: 10,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subLabel2,
                    style: TextStyle(
                      fontSize: 10,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
