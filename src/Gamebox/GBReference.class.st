Class {
	#name : 'GBReference',
	#superclass : 'GBNode',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBReference >> addedTo: aNode [

	super addedTo: aNode.
	aNode announcer
		when: GBADrawingNow 
		do: [ :evt | self drawChildren: evt context evt: evt ]
		for: self.
	aNode announcer
		when: GBMouseEvent
		do: [ :evt | self handleMouseEvent: evt ]
		for: self
]

{ #category : 'accessing' }
GBReference >> drawChildren: ctx evt: evt [

	ctx save.
	self moveContext: ctx.
	announcer announce: evt.
	ctx restore
]

{ #category : 'accessing' }
GBReference >> forwardEvent [

	^ super forwardEvent - GBADrawingNow - GBMouseEvent 
]

{ #category : 'accessing' }
GBReference >> handleMouseEvent: ev [

	| oldPos |
	oldPos := ev position.
	ev position: (self movePoint: oldPos).
	announcer announce: ev.
	ev position: oldPos
]

{ #category : 'accessing' }
GBReference >> moveContext: ctx [

	self subclassResponsibility 
]

{ #category : 'accessing' }
GBReference >> movePoint: oldPos [

	self subclassResponsibility 
]
