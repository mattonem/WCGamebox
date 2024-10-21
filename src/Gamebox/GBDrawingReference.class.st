Class {
	#name : 'GBDrawingReference',
	#superclass : 'GBNode',
	#instVars : [
		'position',
		'angle'
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
	children do: [ :child | announcer announce: evt ].
	anObject rotate: 0 - angle.
	anObject translate: 0 - position x and: 0 - position y
]

{ #category : 'accessing' }
GBDrawingReference >> forwardEvent [

	^ super forwardEvent - GBDrawingNow
]

{ #category : 'accessing' }
GBDrawingReference >> initialize [

	super initialize.
	angle := 0.
	position := 0 @ 0
]

{ #category : 'accessing' }
GBDrawingReference >> position [

	^ position
]

{ #category : 'accessing' }
GBDrawingReference >> position: anObject [

	position := anObject
]
