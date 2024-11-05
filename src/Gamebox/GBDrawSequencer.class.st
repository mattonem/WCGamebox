Class {
	#name : 'GBDrawSequencer',
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
GBDrawSequencer >> addedTo: aNode [

	aNode announcer
		when: GBDrawFullClearSequenceStart
		do: [ :evt |
			self fullClear: evt context.
			self draw: aNode evt: evt ]
		for: self.
	aNode announcer
		when: GBDrawNoClearSequenceStart
		do: [ :evt | self draw: aNode evt: evt ]
		for: self
]

{ #category : 'as yet unclassified' }
GBDrawSequencer >> draw: aNode evt: evt [

	| ctx |
	ctx := evt context.
	drawingEvent context: ctx.
	^ window requestAnimationFrame: [
		  aNode announcer announce: drawingEvent ]
]

{ #category : 'accessing' }
GBDrawSequencer >> drawingEvent [

	^ drawingEvent
]

{ #category : 'accessing' }
GBDrawSequencer >> drawingEvent: anObject [

	drawingEvent := anObject
]

{ #category : 'as yet unclassified' }
GBDrawSequencer >> fullClear: ctx [

	ctx
		clearRect: 0
		and: 0
		to: ctx canvas width
		and: ctx canvas height
]

{ #category : 'as yet unclassified' }
GBDrawSequencer >> initialize [

	super initialize.
	drawingEvent := GBFullDrawingNow new yourself
]
