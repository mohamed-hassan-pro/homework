/*
3. Unique Visitor Counter
You are building a mobile app that tracks unique visitors per day.
- Each visitor is identified by an ID (an integer).
- During the day, the app receives many repeated IDs (because the same user may open the app
multiple times).
- You need to count how many unique visitors used the app today.
Write code that, given a list of visitor IDs, returns the number of unique visitors.
*/
void main() {
  List<int> visitorIds = [101, 102, 103, 101, 104, 102, 105];
  
  Set<int> uniqueVisitors = {};
  
  for (int id in visitorIds) {
    uniqueVisitors.add(id);
  }
  
  print("Number of unique visitors: ${uniqueVisitors.length}");
}