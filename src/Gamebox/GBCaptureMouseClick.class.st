Class {
	#name : 'GBCaptureMouseClick',
	#superclass : 'GBCaptureMouseEvent',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBCaptureMouseClick >> eventType [
	^ 'mousemove'
]

{ #category : 'as yet unclassified' }
GBCaptureMouseClick >> onCanvas: canvas [
	super onCanvas: canvas.
	canvas onMouseClickDo: [ :e |
		parent announcer announce: (GBMouseClick new with: e) ].
]
