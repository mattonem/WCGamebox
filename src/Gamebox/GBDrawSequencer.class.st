Class {
	#name : 'GBDrawSequencer',
	#superclass : 'GBElement',
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBDrawSequencer >> addedTo: aNode [

	aNode announcer
		when: GBDrawSequenceStart
		do: [ :evt |
			| ctx |
			ctx := evt context.

			ctx
				clearRect: 0
				and: 0
				to: ctx canvas width
				and: ctx canvas height.
			window requestAnimationFrame: [
				aNode announcer announce: (GBDrawingNow new
						 context: ctx;
						 yourself) ] ]
		for: self
]
