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
  
  Note(this.title, this.content);
}

class NotesApp {
  List<Note> notes = [];

  void createNote(String title, String content) {
    notes.add(Note(title, content));
  }

  void listNotes() {
    for (int i = 0; i < notes.length; i++) {
      print(notes[i].title + " : " + notes[i].content);
    }
  }

  Note? searchNoteByTitle(String title) {
    for (int i = 0; i < notes.length; i++) {
      if (notes[i].title == title) {
        return notes[i];
      }
    }
    return null;
  }
}

void main() {
  NotesApp app = NotesApp();

  app.createNote("Meeting", "Project discussion");
  app.createNote("Shopping", "Milk Eggs Bread");

  print("All Notes");
  app.listNotes();

  Note? result = app.searchNoteByTitle("Meeting");

  if (result != null) {
    print("Found: " + result.title);
  } else {
    print("Not found");
  }
}