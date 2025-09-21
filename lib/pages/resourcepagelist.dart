// resourcelistpage.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// Reuse the Resource data model
class Resource {
  final String title;
  final String description;
  final String fileType;
  final String date;
  final String url;

  Resource({
    required this.title,
    required this.description,
    required this.fileType,
    required this.date,
    required this.url,
  });
}

class ResourceListPage extends StatelessWidget {
  final String subjectTitle;
  final String branch;
  final int semester;
  final String resourceType;

  const ResourceListPage({
    super.key,
    required this.subjectTitle,
    required this.branch,
    required this.semester,
    required this.resourceType,
  });

  // Dummy data based on the resource type
  List<Resource> _getDummyResources(String type) {
    if (type == 'Notes') {
      return [
        Resource(
          title: 'Thermodynamics Principles for Engineers',
          description: 'Comprehensive notes covering key concepts and applications in thermodynamics for engineering students.',
          fileType: 'PDF',
          date: '2023-10-26',
          url: 'https://drive.google.com/your-thermo-notes-link',
        ),
        Resource(
          title: 'Fluid Mechanics: Advanced Topics',
          description: 'Detailed study materials on advanced fluid dynamics, including Navier-Stokes equations and boundary layers.',
          fileType: 'PDF',
          date: '2023-10-25',
          url: 'https://drive.google.com/your-fluid-mech-notes-link',
        ),
        Resource(
          title: 'Heat Transfer Mechanisms',
          description: 'Exploration of conduction, convection, and radiation with practical engineering examples and solved problems.',
          fileType: 'PDF',
          date: '2023-10-24',
          url: 'https://drive.google.com/your-heat-transfer-notes-link',
        ),
      ];
    } else if (type == 'Previous Year Question Paper') {
      return [
        Resource(
          title: 'PYQ 2022 (Solved)',
          description: 'Previous year question paper with detailed solutions for 2022 batch.',
          fileType: 'PDF',
          date: '2023-10-25',
          url: 'https://drive.google.com/your-pyq-link',
        ),
      ];
    }
    // Add more conditions for other resource types (Lab Manual, Assignments, etc.)
    return [];
  }

  // Function to launch URL
  Future<void> _launchUrl(String url) async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Resource> resources = _getDummyResources(resourceType);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          resourceType,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
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
        child: ListView.builder(
          itemCount: resources.length,
          itemBuilder: (context, index) {
            final resource = resources[index];
            return _buildResourceCard(context, resource);
          },
        ),
      ),
    );
  }

  Widget _buildResourceCard(BuildContext context, Resource resource) {
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
          Row(
            children: [
              const Icon(Icons.description, color: Colors.deepOrangeAccent),
              const SizedBox(width: 8),
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
            ],
          ),
          const SizedBox(height: 10),
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
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.download_rounded, color: Colors.black54),
                    onPressed: () => _launchUrl(resource.url),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border_rounded, color: Colors.black54),
                    onPressed: () {
                      // TODO: Implement bookmark functionality
                    },
                  ),
                ],
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