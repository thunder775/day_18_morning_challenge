import 'package:test/test.dart';
import 'main.dart';
main(){
  test('aquianteces and friends list', (){
    expect(noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly."), [["spot", "see"], []]);
  });
  test('does Rhyme ',(){
    expect(doesRhyme("Sam I am!", "Green eggs and ham.") , true);
  });
}