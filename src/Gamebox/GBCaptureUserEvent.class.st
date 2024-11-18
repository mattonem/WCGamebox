Class {
	#name : 'GBCaptureUserEvent',
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
GBCaptureUserEvent >> addedTo: aNode [

	super addedTo: aNode.
	parent := aNode.
]

{ #category : 'as yet unclassified' }
GBCaptureUserEvent >> deleteFrom: aNode [
	super deleteFrom: aNode .
	parent := nil.
	canvas removeEventListener: self eventType 
]

{ #category : 'as yet unclassified' }
GBCaptureUserEvent >> eventClass [
	'onkeydown'
]

{ #category : 'as yet unclassified' }
GBCaptureUserEvent >> eventType [
	self subclassResponsibility.
]

{ #category : 'as yet unclassified' }
GBCaptureUserEvent >> initialize [ 
	super initialize .
	event := self eventClass new
]

{ #category : 'as yet unclassified' }
GBCaptureUserEvent >> onCanvas: aCanvas [

	canvas := aCanvas.

]
