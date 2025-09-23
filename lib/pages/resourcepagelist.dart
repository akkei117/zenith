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
  List<Resource> _getDummyResources(String type, String subjectTitle) {
    if (type == 'Notes') {
      return [
        Resource(
          title: 'Comming Soon',
          description:
              'Comprehensive notes covering key concepts and applications Comming Soon.',
          fileType: 'PDF',
          date: '2023-10-26',
          url: 'https://drive.google.com/your-thermo-notes-link',
        ),
      ];
    }
    // This is the PYQs Section of the Sem 1 \\


    //PYQS of Linear Algebra(Done)
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Linear Algebra") {
      return [
        Resource(
          title: 'End Semesters Test(Linear Algebra)',
          description:
              'Previous year question paper of Linear Algebra(End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gieLcU9pNFTwaLpXbzIzCtjFCSh_xlU9/view',
        ),
        Resource(
          title: 'Mid Semester Test 1 (Linear Algebra)',
          description:
              'Previous year question paper of Linear Algebra(End Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gMPat8kXgqOz1QiB3c3MiJW-emYGt_aC/view',
        ),
      ];
    }
    //PYQS of Basic Electrical Engineering(Done)
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Basic Electrical Engineering") {
      return [
        Resource(
          title: 'End Semester Test (Basic Electrical Engineering)',
          description:
              'Previous year question paper of Basic Electrical Engineering (End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1ltkw1MaaTaWzRpO-mhJG0Let-0FRCRgl/view',
        ),
        Resource(
          title: 'Mid Semester Test 1 (Basic Electrical Engineering)',
          description:
              'Previous year question paper of Basic Electrical Engineering (Mid Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gvW5UwuVpn8ovXq088nT4wWYeooV6Yo3/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (Basic Electrical Engineering)',
          description:
              'Previous year question paper of Basic Electrical Engineering (Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/12gab3o-24h4XGgnm9Tp0AMRAhCM3BfYk/view',
        ),
      ];
    }
    //PYQs of Applied Chemistry(Done)
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Applied Chemistry") {
      return [
        Resource(
          title: 'End Semester Test (Applied Chemistry)',
          description:
              'Previous year question paper of Applied Chemistry (End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1hdp4exzbBUK-5goxQRRSe-XV7UdDWTPe/view',
        ),
        Resource(
          title: 'Mid Semester Test 1 Applied Chemistry)',
          description:
              'Previous year question paper of Applied Chemistry (Mid Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1h02ePpEYSJG3gUw94Q05Bkqw8TJYLyTe/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (Applied Chemistry)',
          description:
              'Previous year question paper of Applied Chemistry (Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1hKsgPQ04Ec0oIqxY5JimdkhRzFcUPN-0/view',
        ),
      ];
    }
    //PYQs of Fundamentals of Mechanical Engineering(Done)
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Fundamentals of Mechanical Engineering") {
      return [
        Resource(
          title: 'End Semester Test (all subjects)',
          description:
              'Previous year question paper of all subjects (End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/12e-2Gfr2ukPxISi3zGYaG4OTrffwsAjg/view',
        ),
        Resource(
          title: 'Mid Semester Test 1 Fundamentals of Mechanical Engineering)',
          description:
              'Previous year question paper of Fundamentals of Mechanical Engineering (Mid Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1grKlyLLpthkneqtKm1PnkrsDkkrbKS9L/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (Fundamentals of Mechanical Engineering)',
          description:
              'Previous year question paper of Fundamentals of Mechanical Engineering (Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1hEVcjzMAkXAqikFYmr9beu1up1CxjW3G/view',
        ),
      ];
    }
    //PYQs of Engineering Mechanics(Done)
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Engineering Mechanics") {
      return [
        Resource(
          title: 'End Semester Test (Engineering Mechanics)',
          description:
              'Previous year question paper of Engineering Mechanics (End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1hZGIudcV2FJv_LvogKBQ_wX9_x6MUBZW/view',
        ),
        Resource(
          title: 'Mid Semester Test 1 Engineering Mechanics)',
          description:
              'Previous year question paper of Engineering Mechanics (Mid Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1hB_hK1huqKywlX-9fzhGB7cc7PJ1i-LD/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (Engineering Mechanics)',
          description:
              'Previous year question paper of Engineering Mechanics (Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1hZGIudcV2FJv_LvogKBQ_wX9_x6MUBZW/view',
        ),
      ];
    }
    //PYQs of Communicative English
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Communicative English") {
      return [
        Resource(
          title: 'End Semester Test (Communicative English)',
          description:
              'Previous year question paper of Communicative English (End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/your-pyq-link',
        ),
        Resource(
          title: 'Mid Semester Test 1 Communicative English)',
          description:
              'Previous year question paper of Communicative English (Mid Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gyXBwVaLIPfa38-vK8-LYKhsJxuYMNl5/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (all subjects)',
          description:
              'Previous year question paper of all subjects (Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/12gab3o-24h4XGgnm9Tp0AMRAhCM3BfYk/view',
        ),
      ];
    }
    // This is the PYQs Section of the Sem 2 \\
    //PYQS of Basic Electronics Engineering(Done)
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Basic Electronics Engineering") {
      return [
        Resource(
          title: 'End Semesters Test(Basic Electronics Engineering)',
          description:
              'Previous year question paper of Basic Electronics Engineering(End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gVZw_5VHcr92PQqxufpkWjifiByeLXjh/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (Basic Electronics Engineering)',
          description:
              'Previous year question paper of Basic Electronics Engineering(Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gVZp4faGGSBNP1JaWyJxjs2ApEdc7hgk/view',
        ),
      ];
    }
    //PYQS of Optics and Morden Physics(Done)
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Optics and Morden Physics") {
      return [
        Resource(
          title: 'End Semester Test (Optics and Morden Physics)',
          description:
              'Previous year question paper of Optics and Morden Physics (End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gipXwAprh5OplU3hv0mWj7p9wDc9inxv/view',
        ),
        Resource(
          title: 'Mid Semester Test 1 (Optics and Morden Physics)',
          description:
              'Previous year question paper of Optics and Morden Physics (Mid Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1g3GMb-lZxWK9MaJ_7JowRaYhKSleeVKW/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (Optics and Morden Physics)',
          description:
              'Previous year question paper of Optics and Morden Physics (Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gO28Z-NYw8TDsxikOH0C1f65pYwCfVwm/view',
        ),
      ];
    }
    //PYQs of Calculus
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Calculus") {
      return [
        Resource(
          title: 'End Semester Test (Calculus)',
          description:
              'Previous year question paper of Calculus (End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1hQYwAhDr_0XQkQAaKtZGT-Ajsvq3Jtjm/view',
        ),
        Resource(
          title: 'Mid Semester Test 1 (Calculus)',
          description:
              'Previous year question paper of Calculus (Mid Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gnrzhBx5bBZM8dYTP9Jsqur1UBZ1x9qi/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (Calculus)',
          description:
              'Previous year question paper of Calculus (Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1hDfLpP8cGrn4GMJ-1oWDo26B6xky6bU5/view',
        ),
      ];
    }
    //PYQs of Engineering Graphics and Visiulation(Done)
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Engineering Graphics and Visiulation") {
      return [
        Resource(
          title: 'End Semester Test (Engineering Graphics and Visiulation)',
          description:
              'Previous year question paper of Engineering Graphics and Visiulation (End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1ghNpYJV00bIjiiQxg47W62AsdRimRlkM/view',
        ),
        Resource(
          title: 'Mid Semester Test 1 Engineering Graphics and Visiulation)',
          description:
              'Previous year question paper of Engineering Graphics and Visiulation (Mid Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1g11hIwMLRNpcINbhhc59SvqdR0S1cxPB/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (Engineering Graphics and Visiulation)',
          description:
              'Previous year question paper of Engineering Graphics and Visiulation (Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gKSryWhJnlqz9IXbazgmymm9IopQ8pJ2/view',
        ),
      ];
    }
    //PYQs of Basic Civil Engineering(Done
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Basic Civil Engineering") {
      return [
        
        Resource(
          title: 'Mid Semester Test 1 (Basic Civil Engineering)',
          description:
              'Previous year question paper of Basic Civil Engineering (Mid Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1g5v4O4L3MdfS3Sy5j-iWuty8vteVbGFG/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (Basic Civil Engineering)',
          description:
              'Previous year question paper of Basic Civil Engineering (Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gHWnhgkhj4X2LqYUph35o3RDe3AIeeP3/view',
        ),
      ];
    }
    //PYQs of Programming for Problem Solving()
    else if (type == 'Previous Year Question Paper' &&
        subjectTitle == "Programming for Problem Solving") {
      return [
        Resource(
          title: 'End Semester Test (Programming for Problem Solving)',
          description:
              'Previous year question paper of Programming for Problem Solving (End Semester Test).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gYhAv9glMphCdWmBjNw8SaTYqjJbtZSs/view',
        ),
        Resource(
          title: 'Mid Semester Test 1 Programming for Problem Solving)',
          description:
              'Previous year question paper of Programming for Problem Solving (Mid Semester Test 1).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gEz5ySyvWGwWV73YhOLBpYJO_Xcmz0Bb/view',
        ),
        Resource(
          title: 'Mid Semester Test 2 (Programming for Problem Solving)',
          description:
              'Previous year question paper of Programming for Problem Solving (Mid Semester Test 2).',
          fileType: 'PDF',
          date: '22-07-2025',
          url: 'https://drive.google.com/file/d/1gScte4m-UBzz0nFikpj6mmHG83XP5R1x/view',
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
    List<Resource> resources = _getDummyResources(resourceType, subjectTitle);

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
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.download_rounded,
                      color: Colors.black54,
                    ),
                    onPressed: () => _launchUrl(resource.url),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
              Text(
                resource.date,
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
