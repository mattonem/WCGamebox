Class {
	#name : 'GBDrawingRotation',
	#superclass : 'GBReference',
	#instVars : [
		'angle'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBDrawingRotation >> angle [

	^ angle
]

{ #category : 'as yet unclassified' }
GBDrawingRotation >> angle: anObject [

	angle := anObject
]

{ #category : 'as yet unclassified' }
GBDrawingRotation >> deg [
	^ angle radiansToDegrees
]

{ #category : 'as yet unclassified' }
GBDrawingRotation >> deg: anObject [

	angle := anObject degreesToRadians
]

{ #category : 'accessing' }
GBDrawingRotation >> initialize [

	super initialize.
	angle := 0.
]

{ #category : 'accessing' }
GBDrawingRotation >> moveContext: ctx [

	ctx rotate: angle
]

{ #category : 'accessing' }
GBDrawingRotation >> movePoint: oldPos [

	^ oldPos rotateBy: angle about: 0 @ 0
]

{ #category : 'accessing' }
GBDrawingRotation >> movePointUp: oldPos [

	^ oldPos rotateBy: -1 *  angle about: 0 @ 0
]
