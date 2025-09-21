import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Data model for a single resource
class Resource {
  final String title;
  final String description;
  final String fileType;
  final String date;

  Resource({
    required this.title,
    required this.description,
    required this.fileType,
    required this.date,
  });
}

class SubjectDetails extends StatelessWidget {
  final String subjectTitle;
  final String branch;
  final int semester;

  const SubjectDetails({
    super.key,
    required this.subjectTitle,
    required this.branch,
    required this.semester,
  });

  // Dummy data for recently added resources based on subject
  List<Resource> _getDummyResources(String subjectTitle) {
    if (subjectTitle == 'Applied Chemistry') {
      return [
        Resource(
          title: 'Chapter 1: Atomic Structure Notes',
          description: 'Comprehensive notes covering atomic models and quantum numbers.',
          fileType: 'PDF',
          date: '2023-10-26',
        ),
        Resource(
          title: 'PYQ Set 2022 (Solved)',
          description: 'Previous year question paper with detailed solutions for 2022 batch.',
          fileType: 'PDF',
          date: '2023-10-25',
        ),
        Resource(
          title: 'Assignment 1: Chemical Bonding',
          description: 'Submission deadline for Assignment 1 is 2023-11-10.',
          fileType: 'DOCX',
          date: '2023-10-24',
        ),
      ];
    } else if (subjectTitle == 'Linear Algebra') {
      return [
        Resource(
          title: 'Lecture 1: Introduction to Vectors',
          description: 'Notes on vector spaces, subspaces, and linear combinations.',
          fileType: 'PDF',
          date: '2023-10-28',
        ),
        Resource(
          title: 'Assignment 1: Matrices',
          description: 'Problems on matrix operations and inverses.',
          fileType: 'PDF',
          date: '2023-10-27',
        ),
      ];
    }
    // Return an empty list or default resources for other subjects
    return [];
  }

  @override
  Widget build(BuildContext context) {
    List<Resource> resources = _getDummyResources(subjectTitle);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          subjectTitle,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildSubjectInfo(branch, semester),
              const SizedBox(height: 20),
              _buildResourceGrid(),
              const SizedBox(height: 30),
              _buildRecentResourcesTitle(),
              const SizedBox(height: 10),
              ...resources.map((resource) => _buildResourceCard(resource)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectInfo(String branch, int semester) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$branch | $semester${_getSemesterSuffix(semester)} Semester',
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: Colors.black54,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _getSemesterSuffix(int semester) {
    if (semester == 1) return 'st';
    if (semester == 2) return 'nd';
    if (semester == 3) return 'rd';
    return 'th';
  }

  Widget _buildResourceGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      childAspectRatio: 0.9,
      children: [
        _buildResourceItem('Notes', Icons.notes_outlined),
        _buildResourceItem('Previous Year Question Paper', Icons.description_outlined),
        _buildResourceItem('Lab Manual', Icons.science_outlined),
        _buildResourceItem('Assignments', Icons.assignment_outlined),
      ],
    );
  }

  Widget _buildResourceItem(String title, IconData icon) {
    return Container(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.deepOrangeAccent, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentResourcesTitle() {
    return Text(
      'Recently Added Resources',
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }

  Widget _buildResourceCard(Resource resource) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            resource.title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            resource.description,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  resource.fileType,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                resource.date,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}