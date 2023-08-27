import 'package:flutter/material.dart';

void main() {
  runApp(PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoryLibraryScreen(),
    );
  }
}


class StoryLibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Library'),
      ),
        
      body: ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the story viewer screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryViewerScreen(story: storyList[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    storyList[index].coverImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    storyList[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StoryViewerScreen extends StatelessWidget {
  final Story story;

  StoryViewerScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              story.coverImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                story.content,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement interactive elements or read-aloud functionality
              },
              child: const Text('Read Aloud'),
            ),
          ],
        ),
      ),
    );
  }
}

 
class Story {
  final String title;
  final String coverImage;
  final String content;

  Story({required this.title, required this.coverImage, required this.content});
}

// Dummy data
List<Story> storyList = [
  Story(
    title: 'The Adventure of Alex',
    coverImage: 'assets/images/alex.jpg',
    content: 
         'Over the course of the last few years I have had many adventure stories to share but I don’t suppose there are many quite as dramatic or life changing as my own.I never really thought about it until now, until I took the time to reflect.My father was a soldier and was stationed out here, inBangalore, South India during the Second World War. He was part of the Signals operation and much of his time was spent riding around on AJS and Matchless motorcycles. I can only imagine how different India must have been in those days. From his many, many stories, and I am sure we have all heard the ‘old soldier’ stories at some point in our lives, he had an amazing time. It was life changing for him as a very young man and the future impact it had on his life and the life of others around him was, and is the reason I find myself living here today.',
  ),
   Story(
      title: 'The Lion and the Mouse',
      coverImage: 'assets/images/lion.jpg',
      content:
          'Once upon a time, a lion was sleeping in the forest when a mouse ran over his nose. The lion woke up and was about to eat the mouse when the mouse begged for mercy. The lion laughed at the tiny mouse, but decided to let him go. Later, the lion got caught in a hunter\'s trap, and the mouse came to his rescue by gnawing through the ropes.',
    ),
    Story(
      title: 'The Ant and the Grasshopper',
      coverImage: 'assets/images/ant.jpg',
      content:
          'In a field one summer\'s day a Grasshopper was hopping about, chirping and singing to its heart\'s content. An Ant passed by, bearing along with great toil an ear of corn he was taking to the nest. "Why not come and chat with me," said the Grasshopper, "instead of toiling in that way?" "I am helping to lay up food for the winter," said the Ant, "and recommend you to do the same."',
    ),
    Story(
      title: 'The Tortoise and the Hare',
      coverImage: 'assets/images/tortoise.jpg',
      content:
          'Once upon a time, a tortoise and a hare had a race. The hare was very confident that he would win, so he took a nap during the race. Meanwhile, the tortoise slowly but steadily made his way to the finish line, and won the race.',
    ),
  // Add more stories here
];
