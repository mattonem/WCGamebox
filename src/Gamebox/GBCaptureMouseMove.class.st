Class {
	#name : 'GBCaptureMouseMove',
	#superclass : 'GBCaptureMouseEvent',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBCaptureMouseMove >> onCanvas: canvas [
	super onCanvas: canvas.
	canvas onMouseMoveDo: [ :e |
		parent announcer announce: (GBMouseMove new with: e) ].
]
