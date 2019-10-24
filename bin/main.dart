import 'package:collection/collection.dart';


// Challenge 1
// Write test cases for next 2 challenges. Also include tests for boundary conditions
// For this challenge, the input will be a (long) string.

// Challenge 2
// A word encountered for the first time is a stranger.
// A word encountered thrice becomes an acquaintance.
// A word encountered 5 times becomes a friend.

// Create a function that takes the string and returns a list of two lists.
// The first is a list of acquaintances in the order they became an acquaintance (see example).
// The second is a list of friends in the order they became a friend.
// Words in the friend list should no longer be in the acquaintance list.

// Example
// noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly.")
// ➞ [["spot", "see"], []]
/// "see" was encountered first but "spot" became an acquaintance earlier.
List<List<String>> noStrangers(String statement) {
  String toCheck = clean(statement);
  List words = toCheck.split(' ');
  List<String> acq = [];
  List<String> friends = [];
  Map<String, int> wordCount = {};
  words.forEach((words) {
    wordCount[words] = wordCount.containsKey(words) ? wordCount[words] + 1 : 1;
  });
  print(wordCount);
  wordCount.forEach((key, val) {
    if (wordCount[key] >= 5) {
      friends.add(key);
    } else if (wordCount[key] >= 3) {
      acq.add(key);
    }
  });
  print([acq.toSet().toList(), friends.toSet().toList()]);
  return [acq.toSet().toList(), friends.toSet().toList()];
}

String clean(String data) {
  return data.replaceAll('.', '');
}

// Challenge 3
// Rhyme Time
// Create a function that returns true if two lines rhyme and false otherwise.
// For the purposes of this exercise, two lines rhyme if the last
// word from each sentence contains the same vowels.
// Example:
// doesRhyme("Sam I am!", "Green eggs and ham.") ➞ true
bool doesRhyme(String str1, String str2) {
  List list1 = str1.split(' ');
  List list2 = str2.split(' ');
  String last1 = list1[list1.length - 1];
  String last2 = list2[list2.length - 1];
  List vowel1=[];
  List vowel2=[];
  for (int i = 0; i < last1.length; i++) {
    if(last1[i]=='a'||last1[i]=='e'||last1[i]=='i'||last1[i]=='o'||last1[i]=='u') vowel1.add(last1[i]);
  }for (int i = 0; i < last2.length; i++) {
    if(last2[i]=='a'||last2[i]=='e'||last2[i]=='i'||last2[i]=='o'||last2[i]=='u') vowel2.add(last2[i]);
  }
  print(vowel2);
  print(vowel1);
  Function eq = const ListEquality().equals;
 return eq(vowel2,vowel1);

}

// Challenge 4
// Do All Bigrams (2 character words) Exist?
// You are given an input list of bigrams, and a list of words.
//
// Write a function that returns true if you can find every single bigram from
// this list can be found at least once in an list of words.
//
// Examples
// canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]) ➞ true
bool canFind(List<String> bigrams, List<String> words) {
  bool isThere = false;
  int count = 0;
  for (int i = 0; i < bigrams.length; i++) {
    isThere = false;
    String toFind = bigrams[i];
//    print('to find $toFind');
    for (int j = 0; j < words.length; j++) {
      String word = words[j];
//      print('from the word $word');
      for (int k = 0; k < word.length - 1; k++) {
//        print('substring of the word ${word.substring(k, k + 2)}');
        if (word.substring(k, k + 2) == toFind) {
//          print('got it!!!!!!!!!!');
          isThere = true;
          count++;
          break;
        }
      }
      if (isThere) break;
    }
  }
  print(count);
  return count == bigrams.length;
}

main() {

  print(doesRhyme("Sam I eam!", "Green eggs and hame."));
  noStrangers(
      "See Spot run. See Spot jump. Spot likes jumping. See Spot fly. Spot");
  canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]);
}
