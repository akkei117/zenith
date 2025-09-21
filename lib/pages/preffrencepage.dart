// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:zenith/pages/subjectpages.dart';

class Preffrence extends StatefulWidget {
  const Preffrence({super.key});

  @override
  State<Preffrence> createState() => _PreffrenceState();
}

class _PreffrenceState extends State<Preffrence> {
  String? _selectedBranch;
  String? _selectedSemester;
  bool _toggle = false;
  bool _branchfilled = false;
  bool _semesterfilled = false;

  final List<String> branches = ['CSE-AIML'];
  final List<String> semesters = [
    '1st Semester(common for all)',
    '2nd Semester(Common for all)',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Branch & Semester title
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    "Branch & Semester",
                    style: GoogleFonts.bebasNeue(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),

              Center(
                child: Text(
                  "Select your academic details to get started.",
                  style: GoogleFonts.poppins(
                    color: Colors.grey[700],
                    fontSize: 13,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // Select Branch
              Text(
                "Select Branch",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              _buildDropdown(
                items: branches,
                value: _selectedBranch,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedBranch = newValue;
                    _branchfilled = true;
                  });
                },
                hintText: 'Select your Branch',
              ),

              const SizedBox(height: 20),

              // Select Semester
              Text(
                "Select Semester",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              _buildDropdown(
                items: semesters,
                value: _selectedSemester,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSemester = newValue;
                    _semesterfilled = true;
                  });
                },
                hintText: 'Select your Semester',
              ),
              const SizedBox(height: 30),

              // Remember my choice
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Are you Sure ?",
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CupertinoSwitch(
                    value: _toggle,
                    onChanged: (bool newValue) {
                      setState(() {
                        if (_branchfilled && _semesterfilled) {
                          _toggle = newValue;
                        } else {
                          // Optional: Provide a hint to the user if they try to toggle before selecting
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please select a branch and semester first.',
                                style: GoogleFonts.poppins(),
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      });
                    },
                    activeTrackColor: Colors.deepOrangeAccent,
                    inactiveTrackColor: Colors.grey.shade300,
                    thumbColor: CupertinoColors.white,
                  ),
                ],
              ),

              const Spacer(),

              // The button at the bottom of the screen
              GestureDetector(
                onTap: () {
                  if (_toggle) {
                    final int? semesterNumber =
                        int.tryParse(_selectedSemester!.split(' ')[0][0]);

                    if (semesterNumber != null && _selectedBranch != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubjectPage(
                            semester: semesterNumber,
                            branch: _selectedBranch!,
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _toggle
                        ? Colors.deepOrangeAccent
                        : const Color.fromARGB(116, 255, 109, 64),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Show Subjects",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required List<String> items,
    required String? value,
    required void Function(String?)? onChanged,
    required String hintText,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black54,
          ),
          hint: Text(hintText, style: TextStyle(color: Colors.grey[600])),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          style: const TextStyle(color: Colors.black, fontSize: 16),
          dropdownColor: Colors.white,
        ),
      ),
    );
  }
}