Class {
	#name : 'GBCaptureMouseEvent',
	#superclass : 'GBElement',
	#instVars : [
		'parent',
		'canvas',
		'event'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBCaptureMouseEvent >> addedTo: aNode [

	super addedTo: aNode.
	parent := aNode.
]

{ #category : 'as yet unclassified' }
GBCaptureMouseEvent >> deleteFrom: aNode [
	super deleteFrom: aNode .
	canvas removeEventListener: self eventType 
]

{ #category : 'as yet unclassified' }
GBCaptureMouseEvent >> eventClass [
	self subclassResponsibility.
]

{ #category : 'as yet unclassified' }
GBCaptureMouseEvent >> eventType [
	self subclassResponsibility.
]

{ #category : 'as yet unclassified' }
GBCaptureMouseEvent >> initialize [ 
	super initialize .
	event := self eventClass new
]

{ #category : 'as yet unclassified' }
GBCaptureMouseEvent >> onCanvas: aCanvas [

	canvas := aCanvas.

]
