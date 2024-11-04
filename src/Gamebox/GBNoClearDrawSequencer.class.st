Class {
	#name : 'GBNoClearDrawSequencer',
	#superclass : 'GBADrawSequencer',
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBNoClearDrawSequencer >> addedTo: aNode [

	aNode announcer
		when: GBDrawSequenceStart
		do: [ :evt | self draw: aNode evt: evt ]
		for: self
]

{ #category : 'as yet unclassified' }
GBNoClearDrawSequencer >> draw: aNode evt: evt [

	| ctx |
	ctx := evt context.
	drawingEvent context: ctx.
	^ window requestAnimationFrame: [
		  aNode announcer announce: drawingEvent ]
]
