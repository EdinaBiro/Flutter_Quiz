import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                final bool isCorrectAnswer =
                    data['user_answer'] == data['correct_answer'];

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(30, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              isCorrectAnswer
                                  ? const Color.fromARGB(255, 150, 198, 148)
                                  : const Color.fromARGB(255, 249, 133, 160),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 22, 2, 56),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data['user_answer'] as String,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 202, 171, 252),
                                backgroundColor:
                                    isCorrectAnswer
                                        ? const Color.fromARGB(
                                          50,
                                          150,
                                          198,
                                          148,
                                        )
                                        : const Color.fromARGB(
                                          50,
                                          249,
                                          133,
                                          160,
                                        ),
                              ),
                            ),
                            Text(
                              data['correct_answer'] as String,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 181, 254, 246),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
