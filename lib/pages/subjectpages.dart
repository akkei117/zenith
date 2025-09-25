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

  // --- Subject and Icon Lists for All Semesters and Branches ---
  final List<String> sem1subjects = [
    'Applied Chemistry',
    'Linear Algebra',
    'Basic Electrical Engineering',
    'Fundamentals of Mechanical Engineering',
    'Engineering Mechanics',
    'Communicative English',
  ];
  final List<IconData> sem1icons = [
    Icons.science_outlined,
    Icons.functions_outlined,
    Icons.electrical_services_outlined,
    Icons.precision_manufacturing_outlined,
    Icons.engineering_outlined,
    Icons.record_voice_over_outlined,
  ];

  final List<String> sem2subjects = [
    'Basic Electronics Engineering',
    'Optics and Morden Physics',
    'Calculus',
    'Engineering Graphics and Visiulation',
    'Basic Civil Engineering',
    'Programming for Problem Solving',
  ];
  final List<IconData> sem2icons = [
    Icons.memory_outlined,
    Icons.light_mode_outlined,
    Icons.calculate_outlined,
    Icons.draw_outlined,
    Icons.construction_outlined,
    Icons.computer_outlined,
  ];

  // Assuming 'AIML' is the string for the branch
  final List<String> sem3aimlsubjects = [
    'Introduction to AI',
    'Data Structure and Algorithm',
    'Probability and Statistics',
    'Object Orinted Programming and Methodology',
    'Entrepreneurship and Principles of Management',
    'Computer Organization and Architecture',
  ];
  final List<IconData> sem3aimlicons = [
    Icons.psychology_outlined, // For AI concepts/mind/logic
    Icons.code_outlined, // For data structures and coding/algorithms
    Icons.bar_chart_outlined, // For statistics/graphs/data
    Icons.laptop_chromebook_outlined, // For programming/OOP
    Icons.business_center_outlined, // For business/management/entrepreneurship
    Icons.memory_outlined, // For computer hardware/architecture/memory
  ];
  
  // Placeholder for other Sem 3 branches (e.g., if branch is not AIML)
  // You should add actual subjects for other branches/semesters as needed.
  final List<String> defaultSem3Subjects = [
    'Introduction to AI',
    'Data Structure and Algorithm',
    'Probability and Statistics',
    'Object Orinted Programming and Methodology',
    'Entrepreneurship and Principles of Management',
    'Computer Organization and Architecture',
  ];
  final List<IconData> defaultSem3Icons = [
    Icons.psychology_outlined, // For AI concepts/mind/logic
    Icons.code_outlined, // For data structures and coding/algorithms
    Icons.bar_chart_outlined, // For statistics/graphs/data
    Icons.laptop_chromebook_outlined, // For programming/OOP
    Icons.business_center_outlined, // For business/management/entrepreneurship
    Icons.memory_outlined, // For computer hardware/architecture/memory
  ];
  // -----------------------------------------------------------------

  List<String> _currentSubjects = [];
  List<IconData> _currentIcons = [];
  List<String> _filteredSubjects = [];

  @override
  void initState() {
    super.initState();
    // Select the correct subject and icon list based on the semester and branch
    _initializeSubjectAndIconLists();

    _filteredSubjects = List.from(_currentSubjects);
    _searchController.addListener(_filterSubjects);
  }

  // New method to handle logic for selecting the correct lists
  void _initializeSubjectAndIconLists() {
    if (widget.semester == 1) {
      _currentSubjects = sem1subjects;
      _currentIcons = sem1icons;
    } else if (widget.semester == 2) {
      _currentSubjects = sem2subjects;
      _currentIcons = sem2icons;
    } else if (widget.semester == 3) {
      // Logic for Semester 3
      if (widget.branch.toUpperCase() == 'AIML') {
        _currentSubjects = sem3aimlsubjects;
        _currentIcons = sem3aimlicons;
      } else {
        // Fallback for other branches in Sem 3 (e.g., 'CS', 'ME', etc.)
        // **IMPORTANT:** You will need to define separate lists for other branches
        // (e.g., sem3csesubjects, sem3mechesubjects, etc.) and add logic here.
        _currentSubjects = defaultSem3Subjects;
        _currentIcons = defaultSem3Icons;
      }
    } else {
      // Default to empty for unhandled semesters
      _currentSubjects = [];
      _currentIcons = [];
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterSubjects);
    _searchController.dispose();
    _advancedDrawerController.dispose(); // Also dispose the drawer controller
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

  // Helper function to get the icon for a filtered subject
  IconData _getIconForSubject(String subjectTitle) {
    final originalIndex = _currentSubjects.indexOf(subjectTitle);
    // Ensure the index is valid before accessing the icon list
    if (originalIndex != -1 && originalIndex < _currentIcons.length) {
      return _currentIcons[originalIndex];
    }
    return Icons.error_outline; // Default error icon
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
                  child: const Icon(
                    Icons.whatshot,
                    color: Colors.white,
                    size: 60,
                  ),
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
                      MaterialPageRoute(
                        builder: (context) => const Preffrence(),
                      ),
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Scaffold(
                          body: Center(
                            child: Text("You may leave this Website"),
                          ),
                        ),
                      ),
                    );
                  },
                  leading: const Icon(Icons.exit_to_app),
                  title: Text('Exit', style: GoogleFonts.poppins()),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(fontSize: 12, color: Colors.white54),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: const Text(
                      'Made by Sanidhya Malviya and Shivam Khandelwal\nIn collabration with Ritik Sharma',
                    ),
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
            'Subjects (${widget.branch} - Sem ${widget.semester})', // Updated title
            style: GoogleFonts.bebasNeue(
              color: Colors.black,
              fontSize: 30, // Slightly smaller to fit the text
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
                child: _filteredSubjects.isEmpty
                    ? Center(
                        child: Text(
                          'No subjects found for ${widget.branch} Semester ${widget.semester}.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.0,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 0.9,
                        ),
                        itemCount: _filteredSubjects.length,
                        itemBuilder: (context, index) {
                          final subjectTitle = _filteredSubjects[index];
                          return SubjectCard(
                            title: subjectTitle,
                            icon: _getIconForSubject(subjectTitle), // Use the new helper function
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubjectDetails(
                                    subjectTitle: subjectTitle,
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
