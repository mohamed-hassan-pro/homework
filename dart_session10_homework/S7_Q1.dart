/*
1. Notes App – Organize Your Notes
You are building a simple notes app where users can write and manage their notes.
- Each note should have a title, some content, and the date it was created.
- The app should allow creating new notes.
- The app should allow listing all notes.
- The app should allow searching for a note by its title.
*/
class Note {
  String title;
  String content;
  DateTime dateCreated;

  Note(this.title, this.content, this.dateCreated);
}

class NotesApp {
  List<Note> notes = [];

  void createNote(String title, String content) {
    notes.add(Note(title, content, DateTime.now()));
  }

  List<Note> listNotes() {
    return notes;
  }

  Note? searchNoteByTitle(String title) {
    return notes.firstWhere((note) => note.title == title, orElse: () => null);
  }
}

void main() {
  NotesApp app = NotesApp();
  
  app.createNote("Meeting Notes", "Discussed project timeline and deliverables.");
  app.createNote("Shopping List", "Milk, Eggs, Bread");
  
  print("All Notes:");
  for (var note in app.listNotes()) {
    print("${note.title}: ${note.content}");
  }
  
  var foundNote = app.searchNoteByTitle("Meeting Notes");
  if (foundNote != null) {
    print("\nFound Note: ${foundNote.title}");
  } else {
    print("\nNo note found with that title.");
  }
}