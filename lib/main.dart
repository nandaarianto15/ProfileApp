import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0c0f15),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1a1f29),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF1e2533),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> roleDescriptions = [
    "As a student, I am committed to learning and growing, both academically and personally.\n"
        "I enjoy exploring new ideas, collaborating with peers, and applying the knowledge I gain to real projects.\n"
        "I believe that continuous learning is the key to becoming a better professional in the future.",
    "As a programmer, I am a web developer who is passionate and dedicated to creating engaging and responsive websites.\n"
        "I can work well in a team and take on roles as a Frontend Developer, Backend Developer, or Full-Stack Developer when needed.\n"
        "I easily adapt to new environments and always enjoy exploring new technologies.\n"
        "I strive to achieve the best results by combining creativity and technical skills.\n"
        "I am also open to feedback and continuously seek opportunities to expand my knowledge and skills in web development.",
  ];

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Saya"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
            const SizedBox(height: 15),

            const Text(
              "Nanda Arianto",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _goToPage(0),
                  child: Text(
                    "Student",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
                const Text(" | ",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                GestureDetector(
                  onTap: () => _goToPage(1),
                  child: Text(
                    "Programmer",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "My name is Nanda Arianto.\n"
                "I was born in Samarinda on January 15, 2003.\n"
                "I am male.\n"
                "I am an Indonesian citizen.\n"
                "I live in Samarinda, East Kalimantan, Indonesia.\n"
                "My hobbies are sleeping and playing games.\n"
                "I graduated from SMKN 7 Samarinda.\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 8),

            SizedBox(
              height: 195,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: roleDescriptions.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SingleChildScrollView(
                        child: Text(
                          roleDescriptions[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.blue),
                title: const Text(
                  "+62 823-5365-3223",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.blue),
                title: const Text(
                  "nandaarianto58@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
