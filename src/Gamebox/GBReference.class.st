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
		for: self.
	announcer
		when: GBCollisionLookup
		do: [ :e |
			self moveAllPointsUpOf: e.
			aNode announcer announce: e ]
		for: self.
	aNode announcer
		when: GBCollisionLookdown
		do: [ :e |
			| oldPoints |
			oldPoints := e points copy.
			self moveAllPointsDownOf: e.
			announcer announce: e.
			e points: oldPoints ]
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

	^ super forwardEvent - GBADrawingNow - GBMouseEvent - GBCollisionLookdown
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
GBReference >> moveAllPointsDownOf: e [

	e points: (e points collect: [ :each | self movePoint: each ])
]

{ #category : 'accessing' }
GBReference >> moveAllPointsUpOf: e [

	e points: (e points collect: [ :each | self movePointUp: each ])
]

{ #category : 'accessing' }
GBReference >> moveContext: ctx [

	self subclassResponsibility 
]

{ #category : 'accessing' }
GBReference >> movePoint: oldPos [

	self subclassResponsibility 
]

{ #category : 'accessing' }
GBReference >> movePointUp: oldPos [

	self subclassResponsibility 
]

{ #category : 'accessing' }
GBReference >> upwardEvent [

	^ GBAnnouncementUp - GBCollisionLookup
]
