import 'package:flutter/material.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: -15,
        title: const Text(
          'close',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Mulish',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the body with SingleChildScrollView for scrollability
        child: Column(
          children: [
            Center(
              heightFactor: 2,
              child: Text(
                'Certified Public Accountant',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Mulish',
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                'Here\'s a long summary for the first lecture on Certified Public Accountant (CPA) preparation: '
                'Certified Public Accountant (CPA) Lecture 1: Introduction to the CPA Journey. '
                'The first lecture in the CPA course serves as a foundation for understanding what it takes to become '
                'a Certified Public Accountant. It introduces key concepts, requirements, and the scope of the CPA profession. '
                'Below is a breakdown of the lecture. '
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum. Curabitur '
                'lectus nisi, tristique sit amet orci sed, vehicula ultricies lectus. Integer pellentesque elit sed augue fringilla, '
                'et dapibus ligula cursus. Nulla facilisi. Phasellus pharetra, risus non euismod venenatis, est tortor malesuada nulla, '
                'non dictum leo augue euismod nisl. Vivamus a auctor magna. Curabitur eget mollis leo. Fusce fringilla nibh vel purus '
                'fermentum, non lacinia sapien interdum. Mauris a elit tempor, egestas orci id, venenatis eros. Curabitur viverra ante '
                'in sapien consectetur, et pretium purus scelerisque. Integer et libero a nunc pretium feugiat. Suspendisse potenti. '
                'Sed at purus arcu. Integer imperdiet nibh eu purus tristique, sit amet pharetra enim volutpat. Donec et nunc vestibulum '
                'orci posuere volutpat sed at nulla. Sed in auctor tortor, id sollicitudin nisi. '
                'Duis laoreet urna sit amet augue vulputate, et malesuada ligula scelerisque. Etiam rhoncus ex in turpis pharetra, '
                'vel fringilla tortor vehicula. Aliquam malesuada massa in fringilla elementum. Aenean sit amet fermentum felis. '
                'In ac fermentum tortor. Fusce vestibulum est id fringilla volutpat. In convallis risus id libero cursus, eget '
                'cursus ligula efficitur. Morbi viverra, libero sit amet vulputate elementum, purus est ultricies risus, id malesuada '
                'enim turpis id tortor. Nulla facilisi. Fusce pharetra dolor ac ex tincidunt, non feugiat libero feugiat. Donec eget '
                'mauris ut risus auctor rutrum. Integer tristique lorem non arcu gravida, id gravida turpis convallis.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mulish',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
