Class {
	#name : 'GBCaptureMouseMove',
	#superclass : 'GBCaptureUserEvent',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBCaptureMouseMove >> eventClass [
	^ GBMouseGlobalMove
]

{ #category : 'as yet unclassified' }
GBCaptureMouseMove >> eventType [

	^ 'mousemove'
]

{ #category : 'as yet unclassified' }
GBCaptureMouseMove >> onCanvas: aCanvas [
	super onCanvas: aCanvas.
	canvas onMouseMoveDo: [ :e |
		event with: e.
		parent announcer announce: event ].
]
