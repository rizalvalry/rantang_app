import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/controller/auth_controller.dart';
import 'package:e_commerce_flutter/src/view/screen/point_page.dart';
import 'package:flutter/material.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Map<String, dynamic> memberData = {}; // Inisialisasi dengan data kosong

  @override
  void initState() {
    super.initState();
    _fetchMemberData(); // Panggil fungsi _fetchMemberData saat halaman di-load
  }

  Future<void> _fetchMemberData() async {
    memberData = await AuthController.fetchMemberData();
    setState(() {}); // Perbarui tampilan setelah data diperoleh
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.baseColor,
        title: Text(
          'Profil',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            _headersProfile(context),
            SectionHeader('Info Profil'),
            ProfileItem('Username', memberData['username'] ?? ''),
            ProfileItem('BIO', memberData['bio'] ?? ''),
            SectionHeader('Info Pribadi'),
            ProfileItem('User ID', memberData['userid'] ?? ''),
            ProfileItem('E-mail', memberData['email'] ?? ''),
            ProfileItem('Nomor HP', memberData['hp'] ?? ''),
            ProfileItem('Jenis Kelamin', memberData['jenis_kelamin'] ?? ''),
            ProfileItem('Tanggal Lahir', memberData['tgl_lahir'] ?? ''),
          ],
        ),
      ),
    );
  }
}

Widget _headersProfile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PointPage()));

        },
        child: Card(
          shadowColor: AppColor.baseColor,
          color: Colors.white70,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/images/profile_pic.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      Text('johndoe123'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String label;
  final String value;

  ProfileItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }
}