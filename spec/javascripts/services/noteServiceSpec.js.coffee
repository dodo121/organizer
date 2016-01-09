#= require spec_helper

describe 'Notes Index Controller', ->
  notes = [{
    "id":1,
    "content": "Sint sunt adipisci est quis aut."
  }]

  beforeEach ->
    @http.expectGET('/notes?format=json').respond(notes)
    @createCtrl('NotesCtrl', @scope)
    @http.flush()

  describe 'getAll', ->
    describe 'when notes are present in DB', ->
      it 'fetches all notes', ->
        expect(angular.equals @scope.notes, notes).toBe true

  describe 'destroy', ->
    it 'removes note', ->
      @http.expectDELETE('/notes/1?format=json').respond(204)
      @scope.deleteNote(@scope.notes[0])
      @http.flush()
      expect(@scope.notes.length).toEqual 0

  describe 'saveNote', ->
    describe 'when note is new', ->
      it 'creates new Note', ->
        #@scope.saveNote
        #@http.expectPOST(request)
        #expect(@scope.notes.last.id).notToBe undefined

    describe 'when note is not new', ->
      it 'updates existing note', ->
        @http.expectPUT('/notes/1?format=json').respond(204)
        newNoteContent = 'lorem new content'
        @scope.notes[0].content = newNoteContent
        @scope.saveNote(@scope.notes[0])
        @http.flush()
        expect(@scope.notes[0].content).toEqual newNoteContent