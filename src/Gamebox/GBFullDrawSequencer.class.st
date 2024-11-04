Class {
	#name : 'GBFullDrawSequencer',
	#superclass : 'GBADrawSequencer',
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBFullDrawSequencer >> addedTo: aNode [

	aNode announcer
		when: GBDrawSequenceStart
		do: [ :evt | self draw: aNode evt: evt ]
		for: self
]

{ #category : 'as yet unclassified' }
GBFullDrawSequencer >> draw: aNode evt: evt [

	| ctx |
	ctx := evt context.
	ctx
		clearRect: 0
		and: 0
		to: ctx canvas width
		and: ctx canvas height.
	drawingEvent context: ctx.
	^ window requestAnimationFrame: [
		  aNode announcer announce: drawingEvent ]
]
