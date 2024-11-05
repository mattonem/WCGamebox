Class {
	#name : 'GBPartialDrawing',
	#superclass : 'GBNode',
	#instVars : [
		'needsUpdate',
		'subscription'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'adding' }
GBPartialDrawing >> addedTo: aNode [

	super addedTo: aNode.
	subscription := aNode announcer
		                when: GBDrawingNowPartial
		                do: [ :evt |
			                self drawChildren: evt context evt: evt ]
		                for: self.
	subscription := aNode announcer
		                when: GBFullDrawingNow
		                do: [ :evt |
			                self needsUpdate.
			                self drawChildren: evt context evt: evt ]
		                for: self
]

{ #category : 'adding' }
GBPartialDrawing >> drawChildren: ctx evt: evt [

	needsUpdate ifFalse: [ ^ self ].
	announcer announce: evt.
	needsUpdate := false
]

{ #category : 'adding' }
GBPartialDrawing >> forwardEvent [

	^ super forwardEvent - GBADrawingNow  
]

{ #category : 'adding' }
GBPartialDrawing >> initialize [

	super initialize.
	needsUpdate := false
]

{ #category : 'adding' }
GBPartialDrawing >> needsUpdate [

	needsUpdate := true
]
