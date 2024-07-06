import 'dart:convert';

import 'package:aibot/secrets.dart';
import 'package:http/http.dart' as http;


class OpenAIService {
  final List<Map<String, String>> messages = [];

  Future<Object> isArtPromptAPI(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey'
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
              'Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.',
            }
          ],
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        String content = jsonDecode(
            response.body)['choices'][0]['message']['content'];
        content = content.trim();

        switch (content) {
          case 'Yes':
          case 'yes':
          case 'Yes.':
          case 'yes.':
          case 'YES':
          case 'YES.':
            final res = await dallEAPI(prompt);
            return response;
          default:
            final res = await chatGPTAPI(prompt);
            return response;
        }
      }
      return 'Something went wrong!';
    } catch (e) {
      return e.toString();
    }
  }

  // CHATGPT

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey'
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        String content = jsonDecode(
            response.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return 'Something went wrong!';
    } catch (e) {
      return e.toString();
    }
  }

  //DALL-E

  Future<String> dallEAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/images/edits'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey'
        },
        body: jsonEncode({
          'prompt' : prompt,
          'n' : 1,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        String imageUrl = jsonDecode(
            response.body)['data'][0]['url'];
        imageUrl = imageUrl.trim();

        messages.add({
          'role': 'assistant',
          'content': imageUrl,
        });
        return imageUrl;
      }
      return 'Something went wrong!';
    } catch (e) {
      return e.toString();
    }
  }
}
