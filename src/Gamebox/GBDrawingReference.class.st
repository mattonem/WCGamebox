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
GBDrawingReference >> angle [

	^ angle
]

{ #category : 'accessing' }
GBDrawingReference >> angle: anObject [

	angle := anObject
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
