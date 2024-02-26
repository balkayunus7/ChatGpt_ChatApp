import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class GptRepository {
  Future<String?> getGptList() async {
    final response =
        await http.post(Uri.parse('https://api.openai.com/v1/completions'),
            headers: {
              'content-type': 'application/json',
              'Authorization':
                  'Bearer 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'
            },
            body: jsonEncode({
              'model': 'gpt-3.5-turbo-instruct',
              'prompt': 'what is internet',
              'max_tokens': 150,
              'temperature': 0.7,
            }));

    if (response.statusCode == HttpStatus.ok) {
    } else {
      throw Exception(
          'Failed to load data: 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');
    }
    return null;
  }
}
