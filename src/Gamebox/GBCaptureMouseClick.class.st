Class {
	#name : 'GBCaptureMouseClick',
	#superclass : 'GBCaptureMouseEvent',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBCaptureMouseClick >> eventClass [
	^ GBMouseGlobalClick
]

{ #category : 'as yet unclassified' }
GBCaptureMouseClick >> eventType [
	^ 'click'
]

{ #category : 'as yet unclassified' }
GBCaptureMouseClick >> onCanvas: aCanvas [
	super onCanvas: aCanvas.
	canvas onMouseClickDo: [ :e |
		event with: e.
		parent announcer announce: event ].
]
