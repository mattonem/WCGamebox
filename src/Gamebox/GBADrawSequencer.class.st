Class {
	#name : 'GBADrawSequencer',
	#superclass : 'GBElement',
	#instVars : [
		'drawingEvent'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBADrawSequencer >> addedTo: aNode [

	aNode announcer
		when: GBDrawSequenceStart
		do: [ :evt | self draw: aNode evt: evt ]
		for: self
]

{ #category : 'as yet unclassified' }
GBADrawSequencer >> draw: aNode evt: evt [
	self subclassResponsibility
]

{ #category : 'accessing' }
GBADrawSequencer >> drawingEvent [

	^ drawingEvent
]

{ #category : 'accessing' }
GBADrawSequencer >> drawingEvent: anObject [

	drawingEvent := anObject
]

{ #category : 'as yet unclassified' }
GBADrawSequencer >> initialize [

	super initialize.
	drawingEvent := GBDrawingNow new yourself
]
