#= require spec_helper

describe 'Note Factory Spec', ->
  notes = [{
    "id":1,
    "content": "Sint sunt adipisci est quis aut."
  }]

  beforeEach ->
    inject (_Note_) ->
      @Note = _Note_

  describe 'getAll', ->
    describe 'when notes are present in DB', ->
      it 'fetches all notes', ->
        @http.expectGET('/notes?format=json').respond(notes)
        response = @Note.getAll()
        @http.flush()
        expect(angular.equals response[0].content, notes[0].content).toBe true

  describe 'destroy', ->
    it 'removes note', ->
      @http.expectDELETE('/notes/1?format=json').respond(204)
      note = @Note.initNewNote()
      note.id = 1
      spyOn(note, '$delete').and.callThrough()
      @Note.destroy(note)
      @http.flush()
      expect(note.$delete).toHaveBeenCalled()

  describe 'saveNote', ->
    describe 'when note is new', ->
      it 'creates new Note if valid', ->
        @http.expectPOST('/notes?format=json', {'content': 'test'}).respond(201)
        brandNewNote = @Note.initNewNote()
        brandNewNote.content = 'test'
        spyOn(brandNewNote, '$create').and.callThrough()
        @Note.saveNote(brandNewNote)
        @http.flush();
        expect(brandNewNote.$create).toHaveBeenCalled()

      it 'sets validation status to false if invalid', ->
        @http.expectPOST('/notes?format=json', {'content': ''}).respond(422)
        brandNewNote = @Note.initNewNote()
        brandNewNote.content = ''
        response = @Note.saveNote(brandNewNote)
        @http.flush();
        expect(response.validationStatus).toBe false

    describe 'when note is not new', ->
      it 'updates existing note', ->
        @http.expectPUT('/notes/1?format=json').respond(204)
        exisitngNote = @Note.initNewNote()
        exisitngNote.id = 1
        spyOn(exisitngNote, '$save').and.callThrough()
        @Note.saveNote(exisitngNote)
        @http.flush()
        expect(exisitngNote.$save).toHaveBeenCalled()
