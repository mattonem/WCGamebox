Class {
	#name : 'GBDrawingReference',
	#superclass : 'GBNode',
	#instVars : [
		'position',
		'angle',
		'scale',
		'debugPointer'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBDrawingReference >> addedTo: aNode [

	super addedTo: aNode.
	aNode announcer
		when: GBDrawingNow
		do: [ :evt | self drawChildren: evt context evt: evt ]
		for: self.
	aNode announcer
		when: GBMouseEvent
		do: [ :evt | self handleMouseEvent: evt ]
		for: self
]

{ #category : 'accessing' }
GBDrawingReference >> angle [

	^ angle
]

{ #category : 'accessing' }
GBDrawingReference >> angle: anObject [

	angle := anObject
]

{ #category : 'accessing' }
GBDrawingReference >> deg [
	^ angle radiansToDegrees
]

{ #category : 'accessing' }
GBDrawingReference >> deg: anObject [

	angle := anObject degreesToRadians
]

{ #category : 'accessing' }
GBDrawingReference >> drawChildren: anObject evt: evt [

	anObject translate: position x and: position y.
	anObject rotate: angle.
	"ctx.scale(2, 2);"
	anObject scale: scale x and: scale y.
	announcer announce: evt.
	anObject scale: 1 / scale x and: 1 / scale y.
	anObject rotate: 0 - angle.
	anObject translate: 0 - position x and: 0 - position y
]

{ #category : 'accessing' }
GBDrawingReference >> forwardEvent [

	^ super forwardEvent - GBDrawingNow - GBMouseEvent 
]

{ #category : 'accessing' }
GBDrawingReference >> handleMouseEvent: ev [

	| oldPos |
	oldPos := ev position.
	ev position: ev position - position.
	ev position: (ev position rotateBy: angle about: 0 @ 0).
	ev position: ev position x / scale x @ (ev position y / scale y).
	announcer announce: ev.
	ev position: oldPos
]

{ #category : 'accessing' }
GBDrawingReference >> initialize [

	super initialize.
	angle := 0.
	position := 0 @ 0.
	scale := 1 @ 1
]

{ #category : 'accessing' }
GBDrawingReference >> position [

	^ position
]

{ #category : 'accessing' }
GBDrawingReference >> position: anObject [

	position := anObject
]

{ #category : 'accessing' }
GBDrawingReference >> scale [

	^ scale
]

{ #category : 'accessing' }
GBDrawingReference >> scale: anObject [

	scale := anObject
]
