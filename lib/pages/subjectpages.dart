// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:zenith/pages/preffrencepage.dart';
import 'package:zenith/pages/subjectdetails.dart'; // Import the new SubjectDetails page

class SubjectPage extends StatefulWidget {
  final int semester;
  final String branch; // Add branch here

  SubjectPage({super.key, required this.semester, required this.branch});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  final _advancedDrawerController = AdvancedDrawerController();
  final _searchController = TextEditingController();

  final List<String> sem1subject = [
    'Applied Chemistry',
    'Linear Algebra',
    'Basic Electrical Engineering',
    'Fundamentals of Mechanical Engineering',
    'Engineering Mechanics',
    'Communicative English',
  ];
  final List<String> sem2subjects = [
    'Basic Electronics Engineering',
    'Optics and Morden Physics',
    'Calculus',
    'Engineering Graphics and Visiulation',
    'Basic Civil Engineering',
    'Programming for Problem Solving',
  ];

  final List<IconData> sem1icons = [
    Icons.science_outlined,
    Icons.functions_outlined,
    Icons.electrical_services_outlined,
    Icons.precision_manufacturing_outlined,
    Icons.engineering_outlined,
    Icons.record_voice_over_outlined,
  ];
  final List<IconData> sem2icons = [
    Icons.memory_outlined,
    Icons.light_mode_outlined,
    Icons.calculate_outlined,
    Icons.draw_outlined,
    Icons.construction_outlined,
    Icons.computer_outlined,
  ];

  List<String> _currentSubjects = [];
  List<IconData> _currentIcons = [];
  List<String> _filteredSubjects = [];

  @override
  void initState() {
    super.initState();
    // Select the correct subject and icon list based on the semester
    _currentSubjects = widget.semester == 1 ? sem1subject : sem2subjects;
    _currentIcons = widget.semester == 1 ? sem1icons : sem2icons;

    _filteredSubjects = List.from(_currentSubjects);
    _searchController.addListener(_filterSubjects);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterSubjects);
    _searchController.dispose();
    super.dispose();
  }

  void _filterSubjects() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredSubjects = List.from(_currentSubjects);
      } else {
        _filteredSubjects = _currentSubjects
            .where((subject) => subject.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(46)),
      ),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepOrangeAccent, Colors.redAccent],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(top: 24.0, bottom: 64.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.whatshot, color: Colors.white, size: 60),
                ),
                Text(
                  'User',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                ListTile(
                  onTap: () {
                    _advancedDrawerController.hideDrawer();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Preffrence()),
                    );
                  },
                  leading: const Icon(Icons.settings),
                  title: Text(
                    'Branch and Sem Selection',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                
                ListTile(
                  onTap: () {
                    _advancedDrawerController.hideDrawer();
                    // TODO: Implement exit functionality (e.g., using exit(0))
                  },
                  leading: const Icon(Icons.exit_to_app),
                  title: Text('Exit', style: GoogleFonts.poppins()),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(fontSize: 12, color: Colors.white54),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: const Text('Made by Sanidhya Malviya'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Subjects',
            style: GoogleFonts.bebasNeue(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.w300,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              _advancedDrawerController.showDrawer();
            },
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: _filteredSubjects.length,
                  itemBuilder: (context, index) {
                    final originalIndex = _currentSubjects.indexOf(_filteredSubjects[index]);
                    return SubjectCard(
                      title: _filteredSubjects[index],
                      icon: _currentIcons[originalIndex],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubjectDetails(
                              subjectTitle: _filteredSubjects[index],
                              branch: widget.branch,
                              semester: widget.semester,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: Colors.grey),
          hintText: 'Search subjects or resources...',
          border: InputBorder.none,
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    _searchController.clear();
                    _filterSubjects();
                  },
                )
              : null,
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SubjectCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Icon(icon, color: Colors.deepOrangeAccent, size: 30),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}